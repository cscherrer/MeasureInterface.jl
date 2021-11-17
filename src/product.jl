abstract type AbstractProductMeasure <: AbstractMeasure end

function marginals end

function logdensity_def(μ::AbstractProductMeasure, x::AbstractArray)
    mapreduce(logdensity_def, +, marginals(μ), x)
end