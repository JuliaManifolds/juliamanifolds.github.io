# Julia Manifolds

[JuliaManifolds](https://github.com/JuliaManifolds) is an ecosystem of [Julia]() packages
focussing on numerical differential geometry and provide these tools for researchers
for example from physics, robotics or statistics and other areas where [Riemannian manifolds](https://en.wikipedia.org/wiki/Riemannian_manifold)
appear in computations and numerical analysis.
Our goal is to provide these tools in an well-documented and accessible way but also focus on
efficient implementations.

## Overview of registered packages

The following diagram illustrated the interplay within the `JuliaManifolds` ecosystem and
dependencies and extensions into the Julia package ecosystem.

![](assets/diagram.png)

### ManifoldsBase.jl

[`ManifoldsBase.jl`](https://juliamanifolds.github.io/ManifoldsBase.jl/stable/)
defines an API to define a with Riemannian manifolds and how to implement its numerical compuations.
The main focus here is two-fold: On the one hand it allows to define new numerical algorithms
that work on an abstract Riemannian manifold and just depend on the availability of e.g. a [retraction](https://juliamanifolds.github.io/ManifoldsBase.jl/stable/retractions/)
on such a manifold.
It also provides generic construction method for manifolds such as a [product manifolds](https://juliamanifolds.github.io/ManifoldsBase.jl/stable/metamanifolds/#ProductManifold),
[power manifolds](https://juliamanifolds.github.io/ManifoldsBase.jl/stable/metamanifolds/#sec-power-manifold) or the [tangent spaces](https://juliamanifolds.github.io/ManifoldsBase.jl/stable/metamanifolds/#Tangent-Space).
On the other hand it allows to define new manifolds that can be used in such algorithms.

### Manifolds.jl

[`Manifolds.jl`](https://juliamanifolds.github.io/Manifolds.jl/stable/)
provides a library of Riemannian manifolds implemented using the interface provided by `ManifoldsBase.jl`.
Efficient implementations as well as a thorough documentation of the mathematical details
and usability are a main focus of this package.
Some new aspects of Riemannian manifolds are first experimented with in this package before
they are included in the generic interface.

### Manopt.jl

[`Manopt.jl`](https://manoptjl.org) implements algorithms to perform numerical optimisation
of cost functions defined on Riemannian manifolds using the interface provided by `ManifoldsBase.jl`.
The main focus here lies on efficient and modular implementation of the algorithms,
for example with modular [stopping criteria](https://manoptjl.org/stable/plans/stopping_criteria/),
[step sizes](https://manoptjl.org/stable/plans/stepsize/) or sub-solvers, such that these can easily
be exchanged and compared to other choices.

### LieGroups.jl

[`LieGroups.jl`](https://juliamanifolds.github.io/LieGroups.jl/stable/) extends the interface
of `ManifoldsBase.jl` to [Lie groups](https://en.wikipedia.org/wiki/Lie_group), i.e. Riemannian manifolds equipped with a group structure.
It introduces for example the [Lie algebra](https://juliamanifolds.github.io/LieGroups.jl/stable/interface/algebra/),
[group operation](https://juliamanifolds.github.io/LieGroups.jl/stable/interface/operations/) and [group action](https://juliamanifolds.github.io/LieGroups.jl/stable/interface/actions/).
It also introduces general variants to construct Lile groups from these like the [semidirect product Lie group](https://juliamanifolds.github.io/LieGroups.jl/stable/groups/semidirect_product_group/#LieGroups.LeftSemidirectProductGroupOperation).
The focus lies on both an abstract way to define, but also an efficient implementation of Lie groups.
Again, a thorough documentation and testing of the Lie groups is provided as well.

### ManifoldDiffEq.jl

### ManifoldDiff.jl

### ManifoldsGPU.jl

### ManoptExamples.jl

### ManifoldMakie.jl

### ManifoldAsymptote.jl

### Glossaries.jl

### AlgorithmsInterface.jl