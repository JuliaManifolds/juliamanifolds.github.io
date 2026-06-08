# Julia Manifolds

```mermaid
flowchart TB
    classDef registered fill:#EEEDFE,stroke:#534AB7,color:#3C3489
    classDef unregistered fill:#F1EFE8,stroke:#888780,color:#444441
    classDef external fill:#FAC775,stroke:#BA7517,color:#412402

    ManifoldsBase:::registered
    Glossaries:::registered
    AlgorithmsInterface:::registered
    ManifoldDiff:::registered
    Manifolds:::registered
    LieGroups:::registered
    ManifoldDiffEq:::registered
    Manopt:::registered
    ManifoldMakie:::registered
    ManifoldAsymptote:::registered
    ManoptExamples:::registered
    ManifoldsGPU:::registered
    GeometricKalman:::unregistered
    MultivariateDataAnalysis:::unregistered
    ManifoldMeasures:::unregistered
    ManifoldDistributions:::unregistered
    FunManifolds:::unregistered
    ManifoldML:::unregistered
    ManifoldExamples:::unregistered
    StatisticalManifolds:::unregistered
    Makie:::external
    Plots:::external
    Quaternions:::external
    RecursiveArrayTools:::external
    Statistics:::external
    FiniteDiff:::external
    FiniteDifferences:::external
    ForwardDiff:::external
    ReverseDiff:::external
    Zygote:::external
    LRUCache:::external
    LineSearches:::external
    JuMP:::external
    CUDA:::external
    OrdinaryDiffEq:::external
    NLsolve:::external
    HybridArrays:::external
    Distributions:::external
    RecipesBase:::external
    Colors:::external
    BoundaryValueDiffEqMIRK:::external

    Manifolds --> ManifoldsBase
    Manifolds --> ManifoldDiff
    ManifoldDiff --> ManifoldsBase
    Manopt --> ManifoldsBase
    Manopt --> ManifoldDiff
    Manopt --> Glossaries
    Manopt -.-> Manifolds
    Manopt -.-> LRUCache
    Manopt -.-> LineSearches
    Manopt -.-> JuMP
    LieGroups --> ManifoldsBase
    LieGroups --> Manifolds
    LieGroups -.-> RecursiveArrayTools
    ManifoldDiffEq --> ManifoldsBase
    ManifoldDiffEq --> Manifolds
    ManifoldDiffEq --> LieGroups
    ManifoldMakie --> Manifolds
    ManifoldsBase -.-> Makie
    ManifoldsBase -.-> Plots
    ManifoldsBase -.-> Quaternions
    ManifoldsBase -.-> RecursiveArrayTools
    ManifoldsBase -.-> Statistics
    ManifoldDiff -.-> FiniteDiff
    ManifoldDiff -.-> FiniteDifferences
    ManifoldDiff -.-> ForwardDiff
    ManifoldDiff -.-> ReverseDiff
    ManifoldDiff -.-> Zygote
    Manifolds -.-> RecursiveArrayTools
    Manifolds -.-> OrdinaryDiffEq
    Manifolds -.-> NLsolve
    Manifolds -.-> HybridArrays
    Manifolds -.-> Distributions
    Manifolds -.-> RecipesBase
    Manifolds -.-> Colors
    Manifolds -.-> BoundaryValueDiffEqMIRK
    ManoptExamples --> Manifolds
    ManoptExamples --> ManifoldsBase
    ManoptExamples --> ManifoldDiff
    ManoptExamples -.-> Manopt
    ManifoldAsymptote --> Manifolds
    ManifoldsGPU --> Manifolds
    ManifoldsGPU --> ManifoldsBase
    ManifoldsGPU --> ManifoldDiff
    ManifoldsGPU -.-> CUDA
    GeometricKalman --> Manifolds
    GeometricKalman --> ManifoldsBase
    GeometricKalman --> Manopt
    MultivariateDataAnalysis --> Manifolds
    MultivariateDataAnalysis --> ManifoldsBase
    MultivariateDataAnalysis --> Manopt
    ManifoldMeasures --> Manifolds
    ManifoldMeasures --> ManifoldsBase
    FunManifolds --> Manifolds
    FunManifolds --> ManifoldsBase
    ManifoldML --> Manifolds
    ManifoldML --> ManifoldsBase
    ManifoldML --> Manopt
    StatisticalManifolds --> Manifolds
    StatisticalManifolds --> ManifoldsBase
```

The [GitHub Organisation Julia Manifolds](https://github.com/JuliaManifolds)
develops [Julia]() packages involving numerical differential geometry.
Our main interface is [ManifoldsBase.jl](https://juliamanifolds.github.io/manifoldsbase/stable/),
describing how to define a manifold.
The main package build upon that is a library of Riemannian manifolds, [Manifolds.jl](https://juliamanifolds.github.io/manifolds/stable/).
On the other hand we provide packages that provide tools for general manifolds using the main interface, like
[Manopt.jl](https://juliamanifolds.github.io/manopt/stable/) to perform optimization on Manifolds,
[ManifoldDiffEq.jl](https://juliamanifolds.github.io/manifolddiffeq/) to solve differential equations,
or [ManifoldDiff.jl](https://juliamanifolds.github.io/manifolddiff/stable/) to provide AD tools
for functions defined on manifolds.

While all these packages have their own documentation, they are aggregated here as well using
[MultiDocumenter.jl](https://github.com/JuliaComputing/MultiDocumenter.jl) to have a single place for all documentation, especially the overarching search functionality.
