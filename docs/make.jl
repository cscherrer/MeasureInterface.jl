using MeasureInterface
using Documenter

DocMeta.setdocmeta!(MeasureInterface, :DocTestSetup, :(using MeasureInterface); recursive=true)

makedocs(;
    modules=[MeasureInterface],
    authors="Chad Scherrer <chad.scherrer@gmail.com> and contributors",
    repo="https://github.com/cscherrer/MeasureInterface.jl/blob/{commit}{path}#{line}",
    sitename="MeasureInterface.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://cscherrer.github.io/MeasureInterface.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/cscherrer/MeasureInterface.jl",
    devbranch="main",
)
