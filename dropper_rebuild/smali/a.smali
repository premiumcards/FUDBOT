.class public La;
.super Lv;
.source "SourceFile"

# interfaces
.implements Ljava/util/Map;


# instance fields
.field public h:Lp;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lv;-><init>()V

    return-void
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .locals 1

    .line 1
    invoke-virtual {p0}, La;->m()Lp;

    move-result-object v0

    invoke-virtual {v0}, Lp;->l()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1

    .line 1
    invoke-virtual {p0}, La;->m()Lp;

    move-result-object v0

    invoke-virtual {v0}, Lp;->m()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public final m()Lp;
    .locals 1

    .line 1
    iget-object v0, p0, La;->h:Lp;

    if-nez v0, :cond_0

    new-instance v0, La$a;

    invoke-direct {v0, p0}, La$a;-><init>(La;)V

    iput-object v0, p0, La;->h:Lp;

    :cond_0
    iget-object v0, p0, La;->h:Lp;

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2

    .line 1
    iget v0, p0, Lv;->c:I

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lv;->c(I)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lv;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public values()Ljava/util/Collection;
    .locals 1

    .line 1
    invoke-virtual {p0}, La;->m()Lp;

    move-result-object v0

    invoke-virtual {v0}, Lp;->n()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
