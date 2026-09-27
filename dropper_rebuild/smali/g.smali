.class public final synthetic Lg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/android/system/qspaas/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg;->a:Lcom/android/system/qspaas/MainActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lg;->a:Lcom/android/system/qspaas/MainActivity;

    invoke-static {v0}, Lcom/android/system/qspaas/MainActivity;->c(Lcom/android/system/qspaas/MainActivity;)V

    return-void
.end method
