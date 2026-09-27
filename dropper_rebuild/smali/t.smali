.class public final synthetic Lt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/android/system/qspaas/RcvJbrzn;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/system/qspaas/RcvJbrzn;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt;->a:Lcom/android/system/qspaas/RcvJbrzn;

    iput-object p2, p0, Lt;->b:Landroid/content/Context;

    iput-object p3, p0, Lt;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lt;->a:Lcom/android/system/qspaas/RcvJbrzn;

    iget-object v1, p0, Lt;->b:Landroid/content/Context;

    iget-object v2, p0, Lt;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/android/system/qspaas/RcvJbrzn;->a(Lcom/android/system/qspaas/RcvJbrzn;Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
