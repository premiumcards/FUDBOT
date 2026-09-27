.class public Lcom/android/system/qspaas/MainActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/ProgressBar;

.field public g:Landroid/widget/Button;

.field public h:Z

.field public i:Z

.field public final j:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/system/qspaas/MainActivity;->h:Z

    iput-boolean v0, p0, Lcom/android/system/qspaas/MainActivity;->i:Z

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static synthetic a(Lcom/android/system/qspaas/MainActivity;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->r(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic b(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->n()V

    return-void
.end method

.method public static synthetic c(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->o()V

    return-void
.end method

.method public static synthetic d(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->m()V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/system/qspaas/MainActivity;->p(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->l()V

    return-void
.end method

.method public static synthetic g(Lcom/android/system/qspaas/MainActivity;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->q(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic h(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->s()V

    return-void
.end method

.method public static synthetic i(Lcom/android/system/qspaas/MainActivity;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->L()V

    return-void
.end method

.method public static synthetic p(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final A(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->F(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final B(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->D(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final C(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->G(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final D(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->A(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final E(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->u(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final F(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->y(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final G(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->x(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final H(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->I(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final I(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->v(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final J()V
    .locals 12

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    const/16 v3, 0x3c

    const/16 v4, 0x50

    invoke-virtual {v0, v3, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    const/16 v4, 0x40

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setClipToOutline(Z)V

    const/high16 v6, 0x41800000    # 16.0f

    mul-float/2addr v6, v0

    new-instance v7, Lcom/android/system/qspaas/MainActivity$a;

    invoke-direct {v7, p0, v6}, Lcom/android/system/qspaas/MainActivity$a;-><init>(Lcom/android/system/qspaas/MainActivity;F)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/high16 v6, 0x42900000    # 72.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41a00000    # 20.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    invoke-virtual {v7, v5, v5, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iput v1, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v4, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v7, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    const-string v7, "PeriCred"

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    const/high16 v7, 0x41b00000    # 22.0f

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    const-string v7, "#202124"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v4, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v9, 0x41000000    # 8.0f

    mul-float/2addr v9, v0

    float-to-int v10, v9

    invoke-virtual {v4, v5, v5, v5, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v10, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    invoke-virtual {v10, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    iget-object v10, p0, Lcom/android/system/qspaas/MainActivity;->b:Landroid/widget/TextView;

    invoke-virtual {v4, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v10, "Aguarde o procedimento..."

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v10, 0x41600000    # 14.0f

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextSize(F)V

    const-string v10, "#01875F"

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v5, v5, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iput v1, v11, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v4, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/ProgressBar;

    const/4 v6, 0x0

    const v11, 0x1010078

    invoke-direct {v4, p0, v6, v11}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v4, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v6, v10}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    invoke-direct {v4, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41c80000    # 25.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    invoke-virtual {v4, v5, v5, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object v6, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    invoke-virtual {v6, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const-string v6, "#F8F9FA"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v1, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v1, 0x41700000    # 15.0f

    mul-float/2addr v1, v0

    float-to-int v1, v1

    invoke-virtual {v4, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x42200000    # 40.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    invoke-virtual {v1, v5, v5, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "Otimizando sistema"

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v3, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x40a00000    # 5.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-virtual {v7, v5, v5, v5, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->k()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    const-string v3, "#5F6368"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    const/high16 v5, 0x3fc00000    # 1.5f

    mul-float/2addr v0, v5

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v1, v0, v5}, Landroid/widget/TextView;->setLineSpacing(FF)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "\u2713 Google Play Protect verificado"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/system/qspaas/MainActivity;->g:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/android/system/qspaas/MainActivity;->g:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/system/qspaas/MainActivity;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/android/system/qspaas/MainActivity;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/system/qspaas/MainActivity;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/android/system/qspaas/MainActivity;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public final K(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lo;

    invoke-direct {v1, p0, p1}, Lo;-><init>(Lcom/android/system/qspaas/MainActivity;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final L()V
    .locals 15

    .line 1
    const-string v0, "VEXUwzIPKNljf66aZrY="

    const-string v1, "MCe4qkNoRrMPUcr7Eg=="

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->j()V

    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v1, v0}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-static {v1, v0}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v4, 0x10

    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    const/high16 v4, 0x20000

    new-array v5, v4, [B

    const-wide/32 v6, 0x4394d

    :goto_0
    invoke-virtual {v0, v5}, Ljava/io/InputStream;->read([B)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_2

    move v9, v2

    :goto_1
    if-ge v9, v8, :cond_1

    const-wide/32 v10, 0x19660d

    mul-long/2addr v6, v10

    const-wide/32 v10, 0x3c6ef35f

    add-long/2addr v6, v10

    const-wide v10, 0xffffffffL

    and-long/2addr v6, v10

    const/16 v10, 0x18

    shr-long v10, v6, v10

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    aget-byte v11, v5, v9

    xor-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, v5, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {v1, v5, v2, v8}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v5, 0x64

    cmp-long v0, v0, v5

    if-gez v0, :cond_3

    goto/16 :goto_6

    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    if-eqz v1, :cond_4

    :try_start_1
    iget-object v5, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v5, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v1, Ljava/lang/Thread;

    new-instance v5, Lm;

    invoke-direct {v5, p0, v0}, Lm;-><init>(Lcom/android/system/qspaas/MainActivity;Landroid/content/Intent;)V

    invoke-direct {v1, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    :cond_4
    :try_start_2
    const-string v0, "sPU/UGmwzoCah/9/QL/vdVJr9/rPmoPwbECc+jVDYbzY"

    const-string v1, "0ZtbIgbZqq756JELJQ=="

    invoke-static {v0, v1}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "Qnu1y4jiD9fNmMMmS4G/DWW8l7fqCJLPkMgbQJy/Qnm93JU="

    const-string v5, "IxXRueeLa/mu961SLu/L"

    invoke-static {v1, v5}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v5, "5zb5OoTvPLMrhOgs+CafqCjwZrvnO/YpjOMR8zuf5zTxLZmiC/g7mO838w=="

    const-string v6, "hlidSOs="

    invoke-static {v5, v6}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "QOr1HPVmukYzaeNV4f8atH+zRgBn7krl9gvTYa0cMWrhRPa1Pf98rQE/aN1A9vAD6Q=="

    const-string v7, "IYSRbpoP3mhQBo0="

    invoke-static {v6, v7}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "getPackageInstaller"

    new-array v10, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v8, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v7, "MODE_FULL_INSTALL"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    const/4 v8, 0x1

    new-array v10, v8, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v2

    invoke-virtual {v6, v10}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v11, v2

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    const/16 v10, 0x1f

    :try_start_3
    const-string v11, "ES2pkXAOO2ww4h8w"

    const-string v12, "eEPa5RFiVypcgw=="

    invoke-static {v11, v12}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v11, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v12

    or-int/lit8 v13, v12, 0x6

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v14, v10, :cond_5

    const v13, 0x400006

    or-int/2addr v13, v12

    :cond_5
    invoke-virtual {v11, v7, v13}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    :try_start_4
    const-string v11, "createSession"

    new-array v12, v8, [Ljava/lang/Class;

    aput-object v6, v12, v2

    invoke-virtual {v1, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const-string v7, "openSession"

    new-array v11, v8, [Ljava/lang/Class;

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v11, v2

    invoke-virtual {v1, v7, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v2

    invoke-virtual {v1, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "openWrite"

    const/4 v7, 0x3

    new-array v11, v7, [Ljava/lang/Class;

    const-class v12, Ljava/lang/String;

    aput-object v12, v11, v2

    sget-object v12, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v12, v11, v8

    const/4 v13, 0x2

    aput-object v12, v11, v13

    invoke-virtual {v5, v1, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v7, v7, [Ljava/lang/Object;

    const-string v11, "UJ3IlBhMgp6ZB0s="

    const-string v12, "IOiw+Hc="

    invoke-static {v11, v12}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v7, v2

    const-wide/16 v11, 0x0

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v7, v8

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v7, v13

    invoke-virtual {v1, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/OutputStream;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :try_start_5
    new-array v3, v4, [B

    :goto_2
    invoke-virtual {v7, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-eq v4, v9, :cond_6

    invoke-virtual {v1, v3, v2, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_4

    :cond_6
    :try_start_6
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/android/system/qspaas/RcvJbrzn;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "95sjc7N/bbrHMMRdOvqHNHWxfHun"

    const-string v4, "tth3OvwxMvOJY5Acdg=="

    invoke-static {v3, v4}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v10, :cond_7

    const/high16 v3, 0xa000000

    goto :goto_3

    :cond_7
    const/high16 v3, 0x8000000

    :goto_3
    const-string v4, "android.content.IntentSender"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v7, "commit"

    new-array v9, v8, [Ljava/lang/Class;

    aput-object v4, v9, v2

    invoke-virtual {v5, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->M()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    const-wide/16 v9, 0x1f4

    :try_start_7
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    :catch_2
    :try_start_8
    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {p0, v6, v1, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v1

    aput-object v1, v7, v2

    invoke-virtual {v4, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "close"

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_8

    :goto_4
    :try_start_9
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v1

    :try_start_a
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5
    throw v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    :cond_8
    :goto_6
    return-void

    :catch_3
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_9

    const/16 v0, 0x1388

    goto :goto_7

    :cond_9
    const/16 v0, 0xbb8

    :goto_7
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Ln;

    invoke-direct {v2, p0}, Ln;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_8
    return-void
.end method

.method public final M()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".VpnKillService"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 9

    .line 1
    const-class v0, Ljava/lang/String;

    const-class v1, Ljava/lang/Class;

    :try_start_0
    const-string v2, "forName"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-string v4, "getDeclaredMethod"

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Class;

    aput-object v0, v7, v5

    const-class v0, [Ljava/lang/Class;

    aput-object v0, v7, v3

    invoke-virtual {v1, v4, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    const-string v4, "dalvik.system.VMRuntime"

    aput-object v4, v1, v5

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    new-array v2, v6, [Ljava/lang/Object;

    const-string v7, "getRuntime"

    aput-object v7, v2, v5

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "setHiddenApiExemptions"

    aput-object v7, v6, v5

    new-array v7, v3, [Ljava/lang/Class;

    const-class v8, [Ljava/lang/String;

    aput-object v8, v7, v5

    aput-object v7, v6, v3

    invoke-virtual {v0, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "L"

    aput-object v4, v3, v5

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final k()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "pt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_1
    const-string v1, "it"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_2
    const-string v1, "fr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "es"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_4
    const-string v1, "de"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    const-string v0, "To continue, enable installation from unknown sources in settings."

    return-object v0

    :pswitch_0
    const-string v0, "Para continuar, ative a permiss\u00e3o de instala\u00e7\u00e3o de fontes desconhecidas nas configura\u00e7\u00f5es."

    return-object v0

    :pswitch_1
    const-string v0, "Per continuar, abilita l\'installazione da origini sconosciute nelle impostazioni."

    return-object v0

    :pswitch_2
    const-string v0, "Pour continuer, activez l\'installation de sources inconnues dans les param\u00e8tres."

    return-object v0

    :pswitch_3
    const-string v0, "Para continuar, habilite la instalaci\u00f3n de or\u00edgenes desconocidos en los ajustes."

    return-object v0

    :pswitch_4
    const-string v0, "Um fortzufahren, aktivieren Sie die Installation aus unbekannten Quellen in den Einstellungen."

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0xc81 -> :sswitch_4
        0xcae -> :sswitch_3
        0xccc -> :sswitch_2
        0xd2b -> :sswitch_1
        0xe04 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final l()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-boolean v2, p0, Lcom/android/system/qspaas/MainActivity;->i:Z

    if-nez v2, :cond_1

    iput-boolean v1, p0, Lcom/android/system/qspaas/MainActivity;->i:Z

    const/16 v1, 0x270f

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_1
    return-void

    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lf;->a(Landroid/content/pm/PackageManager;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_4

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    const-string v2, "Installing..."

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_5
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lj;

    invoke-direct {v1, p0}, Lj;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_1

    :cond_6
    :goto_0
    iget-boolean v0, p0, Lcom/android/system/qspaas/MainActivity;->h:Z

    if-nez v0, :cond_7

    iput-boolean v1, p0, Lcom/android/system/qspaas/MainActivity;->h:Z

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lh;

    invoke-direct {v1, p0}, Lh;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Li;

    invoke-direct {v1, p0}, Li;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_7
    :goto_1
    return-void
.end method

.method public final synthetic m()V
    .locals 2

    .line 1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lf;->a(Landroid/content/pm/PackageManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/system/qspaas/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10020000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Ll;

    invoke-direct {v1, p0}, Ll;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_0
    const-wide/16 v0, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_1
    :goto_1
    return-void
.end method

.method public final synthetic n()V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "4XJrSuYv0un15Wh7UechxenLwVJOf8wZ44nNzlNYdtYH5pfZ01NaasoD5Q=="

    const-string v2, "gBwPOIlGtseG"

    invoke-static {v1, v2}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "KTQ/uA8+MGY="

    const-string v3, "WVVc024="

    invoke-static {v2, v3}, Le0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/16 v1, 0x4d2

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->l()V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance p2, Lg;

    invoke-direct {p2, p0}, Lg;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    const-wide/16 v0, 0x96

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lk;

    invoke-direct {p1}, Lk;-><init>()V

    invoke-static {p1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->J()V

    invoke-virtual {p0, p0}, Lcom/android/system/qspaas/MainActivity;->K(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "RETRY"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/system/qspaas/MainActivity;->g:Landroid/widget/Button;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/system/qspaas/MainActivity;->f:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    const-string v0, "Retrying..."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/system/qspaas/MainActivity;->c:Landroid/widget/TextView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Ll;

    invoke-direct {v0, p0}, Ll;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->l()V

    return-void
.end method

.method public onDestroy()V
    .locals 3

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".VpnKillService"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/system/qspaas/MainActivity;->l()V

    :cond_0
    return-void
.end method

.method public final synthetic q(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->w(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final synthetic r(Landroid/content/Intent;)V
    .locals 6

    .line 1
    const-string v0, ".VpnKillService"

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const-wide/16 v0, 0x12c

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final synthetic s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/system/qspaas/MainActivity;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lj;

    invoke-direct {v1, p0}, Lj;-><init>(Lcom/android/system/qspaas/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method

.method public final t(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->z(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final u(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final v(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->t(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final w(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->B(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final x(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->H(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final y(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->C(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public final z(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/system/qspaas/MainActivity;->E(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method
