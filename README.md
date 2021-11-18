# MeasureInterface

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://cscherrer.github.io/MeasureInterface.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://cscherrer.github.io/MeasureInterface.jl/dev)
[![Build Status](https://github.com/cscherrer/MeasureInterface.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cscherrer/MeasureInterface.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/cscherrer/MeasureInterface.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/cscherrer/MeasureInterface.jl)

This is a work in progress to pare down [MeasureBase.jl](https://github.com/cscherrer/MeasureBase.jl) to a minimal interface. It's a little easier to start with a clean slate and add things than to modify MeasureBase "in-place".

It's not yet clear whether this package will be registered in addition to MeasureBase, or whether it will work better to use this as a staging ground for a big refactoring of MeasureBase. In the latter case, anything removed (and still useful) would likely be moved to MeasureTheory.
