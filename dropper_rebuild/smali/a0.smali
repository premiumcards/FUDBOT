.class public abstract La0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        La0$f;,
        La0$d;,
        La0$c;,
        La0$e;,
        La0$g;,
        La0$h;,
        La0$b;
    }
.end annotation


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static b:Ljava/util/WeakHashMap;

.field public static c:Z

.field public static final d:[I

.field public static final e:Lq;

.field public static final f:La0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, La0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x0

    sput-object v0, La0;->b:Ljava/util/WeakHashMap;

    const/4 v0, 0x0

    sput-boolean v0, La0;->c:Z

    const/16 v2, 0x20

    new-array v2, v2, [I

    sget v3, Lr;->a:I

    aput v3, v2, v0

    sget v0, Lr;->b:I

    aput v0, v2, v1

    const/4 v0, 0x2

    sget v1, Lr;->m:I

    aput v1, v2, v0

    const/4 v0, 0x3

    sget v1, Lr;->x:I

    aput v1, v2, v0

    const/4 v0, 0x4

    sget v1, Lr;->A:I

    aput v1, v2, v0

    const/4 v0, 0x5

    sget v1, Lr;->B:I

    aput v1, v2, v0

    const/4 v0, 0x6

    sget v1, Lr;->C:I

    aput v1, v2, v0

    const/4 v0, 0x7

    sget v1, Lr;->D:I

    aput v1, v2, v0

    const/16 v0, 0x8

    sget v1, Lr;->E:I

    aput v1, v2, v0

    const/16 v0, 0x9

    sget v1, Lr;->F:I

    aput v1, v2, v0

    const/16 v0, 0xa

    sget v1, Lr;->c:I

    aput v1, v2, v0

    const/16 v0, 0xb

    sget v1, Lr;->d:I

    aput v1, v2, v0

    const/16 v0, 0xc

    sget v1, Lr;->e:I

    aput v1, v2, v0

    const/16 v0, 0xd

    sget v1, Lr;->f:I

    aput v1, v2, v0

    const/16 v0, 0xe

    sget v1, Lr;->g:I

    aput v1, v2, v0

    const/16 v0, 0xf

    sget v1, Lr;->h:I

    aput v1, v2, v0

    const/16 v0, 0x10

    sget v1, Lr;->i:I

    aput v1, v2, v0

    const/16 v0, 0x11

    sget v1, Lr;->j:I

    aput v1, v2, v0

    const/16 v0, 0x12

    sget v1, Lr;->k:I

    aput v1, v2, v0

    const/16 v0, 0x13

    sget v1, Lr;->l:I

    aput v1, v2, v0

    const/16 v0, 0x14

    sget v1, Lr;->n:I

    aput v1, v2, v0

    const/16 v0, 0x15

    sget v1, Lr;->o:I

    aput v1, v2, v0

    const/16 v0, 0x16

    sget v1, Lr;->p:I

    aput v1, v2, v0

    const/16 v0, 0x17

    sget v1, Lr;->q:I

    aput v1, v2, v0

    const/16 v0, 0x18

    sget v1, Lr;->r:I

    aput v1, v2, v0

    const/16 v0, 0x19

    sget v1, Lr;->s:I

    aput v1, v2, v0

    const/16 v0, 0x1a

    sget v1, Lr;->t:I

    aput v1, v2, v0

    const/16 v0, 0x1b

    sget v1, Lr;->u:I

    aput v1, v2, v0

    const/16 v0, 0x1c

    sget v1, Lr;->v:I

    aput v1, v2, v0

    const/16 v0, 0x1d

    sget v1, Lr;->w:I

    aput v1, v2, v0

    const/16 v0, 0x1e

    sget v1, Lr;->y:I

    aput v1, v2, v0

    const/16 v0, 0x1f

    sget v1, Lr;->z:I

    aput v1, v2, v0

    sput-object v2, La0;->d:[I

    new-instance v0, Lz;

    invoke-direct {v0}, Lz;-><init>()V

    sput-object v0, La0;->e:Lq;

    new-instance v0, La0$b;

    invoke-direct {v0}, La0$b;-><init>()V

    sput-object v0, La0;->f:La0$b;

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0}, La0$h;->a(Landroid/view/View;)La0$h;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, La0$h;->b(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static b(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0}, La0$h;->a(Landroid/view/View;)La0$h;

    move-result-object p0

    invoke-virtual {p0, p1}, La0$h;->f(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static c(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-static {p0}, La0$e;->a(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public static d(Landroid/view/View;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {}, La0;->h()La0$c;

    move-result-object v0

    invoke-virtual {v0, p0}, La0$c;->d(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static e(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-static {p0}, La0$d;->c(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public static f(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, La0$e;->b(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static g(Landroid/view/View;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, La0;->d(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getWindowVisibility()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-static {p0}, La0;->c(Landroid/view/View;)I

    move-result v2

    const/16 v3, 0x20

    if-nez v2, :cond_4

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    if-ne p1, v3, :cond_3

    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    invoke-virtual {v1, v3}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    invoke-static {v1, p1}, La0$e;->g(Landroid/view/accessibility/AccessibilityEvent;I)V

    invoke-virtual {v1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setSource(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    move-result-object p1

    invoke-static {p0}, La0;->d(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :try_start_0
    invoke-static {v0, p0, p0, p1}, La0$e;->e(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " does not fully implement ViewParent"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ViewCompat"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    :cond_4
    :goto_1
    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v0

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    const/16 v3, 0x800

    :goto_2
    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    invoke-static {v0, p1}, La0$e;->g(Landroid/view/accessibility/AccessibilityEvent;I)V

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    move-result-object p1

    invoke-static {p0}, La0;->d(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {p0}, La0;->j(Landroid/view/View;)V

    :cond_6
    invoke-virtual {p0, v0}, Landroid/view/View;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_7
    :goto_3
    return-void
.end method

.method public static h()La0$c;
    .locals 5

    .line 1
    new-instance v0, La0$a;

    sget v1, Lr;->G:I

    const/16 v2, 0x8

    const/16 v3, 0x1c

    const-class v4, Ljava/lang/CharSequence;

    invoke-direct {v0, v1, v4, v2, v3}, La0$a;-><init>(ILjava/lang/Class;II)V

    return-object v0
.end method

.method public static i(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, La0$d;->s(Landroid/view/View;I)V

    return-void
.end method

.method public static j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, La0;->e(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {p0, v0}, La0;->i(Landroid/view/View;I)V

    :cond_0
    return-void
.end method
