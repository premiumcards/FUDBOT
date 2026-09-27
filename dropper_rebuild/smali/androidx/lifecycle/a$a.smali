.class public final enum Landroidx/lifecycle/a$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/lifecycle/a$a;

.field public static final enum ON_ANY:Landroidx/lifecycle/a$a;

.field public static final enum ON_CREATE:Landroidx/lifecycle/a$a;

.field public static final enum ON_DESTROY:Landroidx/lifecycle/a$a;

.field public static final enum ON_PAUSE:Landroidx/lifecycle/a$a;

.field public static final enum ON_RESUME:Landroidx/lifecycle/a$a;

.field public static final enum ON_START:Landroidx/lifecycle/a$a;

.field public static final enum ON_STOP:Landroidx/lifecycle/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Landroidx/lifecycle/a$a;

    const-string v1, "ON_CREATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/lifecycle/a$a;->ON_CREATE:Landroidx/lifecycle/a$a;

    new-instance v1, Landroidx/lifecycle/a$a;

    const-string v2, "ON_START"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/lifecycle/a$a;->ON_START:Landroidx/lifecycle/a$a;

    new-instance v2, Landroidx/lifecycle/a$a;

    const-string v3, "ON_RESUME"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v2, Landroidx/lifecycle/a$a;->ON_RESUME:Landroidx/lifecycle/a$a;

    new-instance v3, Landroidx/lifecycle/a$a;

    const-string v4, "ON_PAUSE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/lifecycle/a$a;->ON_PAUSE:Landroidx/lifecycle/a$a;

    new-instance v4, Landroidx/lifecycle/a$a;

    const-string v5, "ON_STOP"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v4, Landroidx/lifecycle/a$a;->ON_STOP:Landroidx/lifecycle/a$a;

    new-instance v5, Landroidx/lifecycle/a$a;

    const-string v6, "ON_DESTROY"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroidx/lifecycle/a$a;->ON_DESTROY:Landroidx/lifecycle/a$a;

    new-instance v6, Landroidx/lifecycle/a$a;

    const-string v7, "ON_ANY"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Landroidx/lifecycle/a$a;-><init>(Ljava/lang/String;I)V

    sput-object v6, Landroidx/lifecycle/a$a;->ON_ANY:Landroidx/lifecycle/a$a;

    filled-new-array/range {v0 .. v6}, [Landroidx/lifecycle/a$a;

    move-result-object v0

    sput-object v0, Landroidx/lifecycle/a$a;->$VALUES:[Landroidx/lifecycle/a$a;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/lifecycle/a$a;
    .locals 1

    const-class v0, Landroidx/lifecycle/a$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/a$a;

    return-object p0
.end method

.method public static values()[Landroidx/lifecycle/a$a;
    .locals 1

    sget-object v0, Landroidx/lifecycle/a$a;->$VALUES:[Landroidx/lifecycle/a$a;

    invoke-virtual {v0}, [Landroidx/lifecycle/a$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/lifecycle/a$a;

    return-object v0
.end method
