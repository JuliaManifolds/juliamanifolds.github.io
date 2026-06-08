# Julia Manifolds

```mermaid
%%{init: {"layout": "elk"}}%%
flowchart TB
    %% Functional grouping
    subgraph Core["Core Packages"]
        ManifoldsBase["ManifoldsBase"]
        Manifolds["Manifolds"]
        ManifoldDiff["ManifoldDiff"]
        LieGroups["LieGroups"]
    end

    subgraph Optimization["Optimization & Algorithms"]
        Manopt["Manopt"]
        ManoptExamples["ManoptExamples"]
        ManifoldDiffEq["ManifoldDiffEq"]
    end

    subgraph Visualization["Visualization"]
        ManifoldMakie["ManifoldMakie"]
        ManifoldAsymptote["ManifoldAsymptote"]
    end

    subgraph Extensions["Extensions & Integrations"]
        ManifoldsGPU["ManifoldsGPU"]
        Glossaries["Glossaries"]
        AlgorithmsInterface["AlgorithmsInterface"]
    end

    subgraph External["External Dependencies"]
        Makie["Makie"]
        Plots["Plots"]
        Quaternions["Quaternions"]
        RecursiveArrayTools["RecursiveArrayTools"]
        Statistics["Statistics"]
        FiniteDiff["FiniteDiff"]
        FiniteDifferences["FiniteDifferences"]
        ForwardDiff["ForwardDiff"]
        ReverseDiff["ReverseDiff"]
        Zygote["Zygote"]
        LRUCache["LRUCache"]
        LineSearches["LineSearches"]
        JuMP["JuMP"]
        CUDA["CUDA"]
        OrdinaryDiffEq["OrdinaryDiffEq"]
        NLsolve["NLsolve"]
        HybridArrays["HybridArrays"]
        Distributions["Distributions"]
        RecipesBase["RecipesBase"]
        Colors["Colors"]
        BoundaryValueDiffEqMIRK["BoundaryValueDiffEqMIRK"]
    end

    %% Core relationships
    Manifolds --> ManifoldsBase & ManifoldDiff
    ManifoldDiff --> ManifoldsBase
    LieGroups --> ManifoldsBase

    %% Optimization
    Manopt --> ManifoldsBase & ManifoldDiff & Glossaries
    ManoptExamples --> Manopt & Manifolds
    ManifoldDiffEq --> ManifoldsBase & Manifolds & LieGroups

    %% Visualization
    ManifoldMakie --> Manifolds
    ManifoldAsymptote --> Manifolds

    %% Extensions
    ManifoldsGPU --> Manifolds & ManifoldsBase
    AlgorithmsInterface --> Manopt
    Glossaries --> Manopt

    %% External dependencies
    ManifoldMakie --> Makie & Colors
    ManifoldAsymptote --> Plots
    ManifoldDiffEq --> OrdinaryDiffEq & NLsolve
    Manopt --> ForwardDiff & ReverseDiff & Zygote & LineSearches & LRUCache
    ManifoldsGPU --> CUDA
    ManifoldDiff --> FiniteDiff & FiniteDifferences
    Manifolds --> Statistics & RecipesBase & HybridArrays
    LieGroups --> Quaternions
    ManoptExamples --> Distributions

    %% Styling
    classDef core stroke:#4f46e5,fill:#eef2ff,color:#312e81
    classDef optimization stroke:#16a34a,fill:#f0fdf4,color:#064e3b
    classDef visualization stroke:#0891b2,fill:#ecfeff,color:#083344
    classDef extensions stroke:#ca8a04,fill:#fefce8,color:#422006
    classDef external stroke:#6b7280,fill:#f9fafb,color:#111827

    class ManifoldsBase,Manifolds,ManifoldDiff,LieGroups core
    class Manopt,ManoptExamples,ManifoldDiffEq optimization
    class ManifoldMakie,ManifoldAsymptote visualization
    class ManifoldsGPU,Glossaries,AlgorithmsInterface extensions
    class Makie,Plots,Quaternions,RecursiveArrayTools,Statistics,FiniteDiff,FiniteDifferences,ForwardDiff,ReverseDiff,Zygote,LRUCache,LineSearches,JuMP,CUDA,OrdinaryDiffEq,NLsolve,HybridArrays,Distributions,RecipesBase,Colors,BoundaryValueDiffEqMIRK external
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
