.class public abstract La0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/lang/Class;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(ILjava/lang/Class;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, La0$c;->a:I

    iput-object p2, p0, La0$c;->b:Ljava/lang/Class;

    iput p3, p0, La0$c;->d:I

    iput p4, p0, La0$c;->c:I

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    return v0
.end method

.method public final b()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    iget v1, p0, La0$c;->c:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public abstract c(Landroid/view/View;)Ljava/lang/Object;
.end method

.method public d(Landroid/view/View;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p0}, La0$c;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, La0$c;->c(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p0}, La0$c;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, La0$c;->a:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, La0$c;->b:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
