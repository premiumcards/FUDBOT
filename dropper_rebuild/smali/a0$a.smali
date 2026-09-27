.class public La0$a;
.super La0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La0;->h()La0$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/Class;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, La0$c;-><init>(ILjava/lang/Class;II)V

    return-void
.end method


# virtual methods
.method public bridge synthetic c(Landroid/view/View;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, La0$a;->e(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public e(Landroid/view/View;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, La0$f;->b(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
