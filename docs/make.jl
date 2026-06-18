#!/usr/bin/env julia
#
#

# ##
if "--help" ∈ ARGS
    println(
        """
docs/make.jl

Render the `JuliaManifolds` GitHub Organisation documentation – a short overview on
the Julia packages this organisation consists of.

Arguments
* `--help`         - print this help and exit without rendering the documentation
* `--serve`        - use `LiveServer.jl` to serve the current docs, also launches the browser
""",
    )
    exit(0)
end

run_on_CI = (get(ENV, "CI", nothing) == "true")
#
# (b) if docs is not the current active environment, switch to it
# (from https://github.com/JuliaIO/HDF5.jl/pull/1020/) 
if Base.active_project() != joinpath(@__DIR__, "Project.toml")
    using Pkg
    Pkg.activate(@__DIR__)
    Pkg.instantiate()
end


using Documenter, LiveServer

# Build local docs - but do bot deploy
makedocs(;
    format=Documenter.HTML(;
        prettyurls = run_on_CI, assets=["assets/favicon.ico"]
    ),
    modules=Module[],
    authors="Ronny Bergmann",
    sitename="Julia Manifolds",
    pages=[
        "Home" => "index.md",
    ],
    version = ""
)

deploydocs(repo = "github.com/JuliaManifolds/juliamanifolds.github.io.git", push_preview = true)

# ## Serve ?
("--serve" in ARGS) && serve(dir=joinpath(@__DIR__, "build"), launch_browser=true)