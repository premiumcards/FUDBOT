.class public Lf0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([B[B)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lf0;->b([B[B)[B

    move-result-object p1

    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public final b([B[B)[B
    .locals 7

    .line 1
    array-length v0, p1

    array-length v1, p2

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    if-ge v3, v0, :cond_1

    if-lt v4, v1, :cond_0

    move v4, v2

    :cond_0
    aget-byte v5, p1, v3

    aget-byte v6, p2, v4

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p1, v3

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method
