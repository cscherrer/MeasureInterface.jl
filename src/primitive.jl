abstract type PrimitiveMeasure <: AbstractMeasure end


struct LebesgueMeasure <: PrimitiveMeasure end

export CountingMeasure

struct CountingMeasure <: PrimitiveMeasure end

struct TrivialMeasure <: PrimitiveMeasure end

logdensity_def(::PrimitiveMeasure, x) = static(0.0)

basemeasure(μ::PrimitiveMeasure) = μ

basemeasure_type(μ::M) where {M<:PrimitiveMeasure} = M

basemeasure_type(::Type{M}) where {M<:PrimitiveMeasure} = M

basemeasure_depth(::Type{M}) where {M<:PrimitiveMeasure} = static(0)