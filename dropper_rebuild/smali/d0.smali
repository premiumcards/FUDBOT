.class public final synthetic Ld0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/io/FileDescriptor;


# direct methods
.method public synthetic constructor <init>(Ljava/io/FileDescriptor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld0;->a:Ljava/io/FileDescriptor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ld0;->a:Ljava/io/FileDescriptor;

    invoke-static {v0}, Lcom/android/system/qspaas/VpnKillService;->a(Ljava/io/FileDescriptor;)V

    return-void
.end method
