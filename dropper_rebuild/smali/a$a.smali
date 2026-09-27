.class public La$a;
.super Lp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La;->m()Lp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:La;


# direct methods
.method public constructor <init>(La;)V
    .locals 0

    .line 1
    iput-object p1, p0, La$a;->d:La;

    invoke-direct {p0}, Lp;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0}, Lv;->clear()V

    return-void
.end method

.method public b(II)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    iget-object v0, v0, Lv;->b:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1
.end method

.method public c()Ljava/util/Map;
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    return-object v0
.end method

.method public d()I
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    iget v0, v0, Lv;->c:I

    return v0
.end method

.method public e(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0, p1}, Lv;->f(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public f(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0, p1}, Lv;->h(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public g(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0, p1, p2}, Lv;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public h(I)V
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0, p1}, Lv;->j(I)Ljava/lang/Object;

    return-void
.end method

.method public i(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, La$a;->d:La;

    invoke-virtual {v0, p1, p2}, Lv;->k(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
