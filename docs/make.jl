#!/usr/bin/env julia
#
#

# ##
if "--help" ∈ ARGS
    println(
        """
docs/make.jl

Render the `JuliaManifolds` GitHub Organisation Multidocumenter with optinal arguments

Arguments
* `--deploy`       - deploy docs to GitHub pages (e.g. on CI)
* `--help`         - print this help and exit without rendering the documentation
* `--serve`        - use `LiveServer.jl` to serve the current docs, also launches the browser
* `--temp`         – clone the other repositories into a temp folder – otherwise use clones/
""",
    )
    exit(0)
end


# ## if docs is not the current active environment, switch to it
# (from https://github.com/JuliaIO/HDF5.jl/pull/1020/) 
if Base.active_project() != joinpath(@__DIR__, "Project.toml")
    using Pkg
    Pkg.activate(@__DIR__)
    Pkg.resolve()
    Pkg.instantiate()
end

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath =  ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "out")

@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

using MultiDocumenter, LiveServer, Documenter

# Build local docs - but do bot deploy
makedocs(;
    format=Documenter.HTML(;
        prettyurls=false, assets=["assets/favicon.ico"]
    ),
    modules=Module[],
    authors="Ronny Bergmann",
    sitename="Julia Manifolds",
    pages=[
        "Home" => "index.md",
    ]
)

# ## Build Multidocs – for now an entry each Repo
docs = [
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__,"build"),
        path = "juliamanifolds",
        name = "Home",
        fix_canonical_url = false,
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "ManifoldsBase.jl"),
        path = "manifoldsbase",
        name = "ManifoldsBase.jl",
        giturl = "https://github.com/JuliaManifolds/ManifoldsBase.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "Manifolds.jl"),
        path = "manifolds",
        name = "Manifolds.jl",
        giturl = "https://github.com/JuliaManifolds/Manifolds.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "Manopt.jl"),
        path = "manopt",
        name = "Manopt.jl",
        giturl = "https://github.com/JuliaManifolds/Manopt.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "ManifoldDiffEq.jl"),
        path = "manifolddiffeq",
        name = "ManifoldDiffEq.jl",
        giturl = "https://github.com/JuliaManifolds/ManifoldDiffEq.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "ManifoldDiff.jl"),
        path = "manifolddiff",
        name = "ManifoldDiff.jl",
        giturl = "https://github.com/JuliaManifolds/ManifoldDiff.jl.git",
    ),
    MultiDocumenter.DropdownNav("Examples", [
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "ManoptExamples.jl"),
            path = "manoptexamples",
            name = "Manopt Examples",
            giturl = "https://github.com/JuliaManifolds/ManoptExamples.jl.git",
        ),
    ]),
]

# ## Build docs
MultiDocumenter.make(
    outpath,
    docs;
    assets_dir = "src/assets",
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    ),
    brand_image = MultiDocumenter.BrandImage("https://juliadocumenter.github.io",
                                                              joinpath("assets",
                                                                       "logo.png")),
)

# ## Deploy
if "--deploy" in ARGS
    @warn "Deploying to GitHub"
    gitroot = normpath(joinpath(@__DIR__, ".."))
    run(`git pull`)
    outbranch = "gh-pages"
    has_outbranch = true
    if !success(`git checkout $outbranch`)
        has_outbranch = false
        if !success(`git switch --orphan $outbranch`)
            @error "Cannot create new orphaned branch $outbranch."
            exit(1)
        end
    end
    # Delete all current files on our current branch besides the .git folder
    for file in readdir(gitroot; join = true)
        endswith(file, ".git") && continue
        rm(file; force = true, recursive = true)
    end
    # copy the rendered docs
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(gitroot, file))
    end
    # Add and commit new files
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout main`)
    else
        @info "No changes to aggregated documentation."
    end
else
    @info "Skipping deployment, '--deploy' not passed. Generated files in docs/$(outpath)."
end
# ## Serve ?
("--serve" in ARGS) && serve(dir=joinpath(@__DIR__, outpath), launch_browser=true)