abstract type AbstractProductMeasure <: AbstractMeasure end

struct ProductMeasure{K,I} <: AbstractProductMeasure
    κ::K
    xs::I
end

marginals(μ::ProductMeasure) = mappedarray(μ.κ, μ.xs)



function logdensity_def(μ::AbstractProductMeasure, x::AbstractArray)
    mapreduce(+, μ.xs, x) do (j,x)
        logdensity_def(μ.κ(j), x)
    end
end