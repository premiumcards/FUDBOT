.class public abstract Le0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lf0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lf0;

    invoke-direct {v0}, Lf0;-><init>()V

    sput-object v0, Le0;->a:Lf0;

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, v0}, Lb;->a(Ljava/lang/String;I)[B

    move-result-object p0

    invoke-static {p1, v0}, Lb;->a(Ljava/lang/String;I)[B

    move-result-object p1

    sget-object v0, Le0;->a:Lf0;

    invoke-virtual {v0, p0, p1}, Lf0;->a([B[B)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, ""

    return-object p0
.end method
