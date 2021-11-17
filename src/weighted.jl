export WeightedMeasure, AbstractWeightedMeasure

"""
    struct WeightedMeasure{R,M} <: AbstractMeasure
        logweight :: R
        base :: M
    end
"""

abstract type AbstractWeightedMeasure <: AbstractMeasure end

logweight(μ::AbstractWeightedMeasure) = μ.logweight
basemeasure(μ::AbstractWeightedMeasure) = μ.base

@inline function logdensity(sm::AbstractWeightedMeasure, x)
    logdensity(sm.base, x) + sm.logweight
end

###############################################################################

struct WeightedMeasure{R,M} <: AbstractWeightedMeasure
    logweight::R
    base::M
end

basemeasure_depth(::WeightedMeasure{R,M}) where {R,M} = static(1) + basemeasure_depth(M)
basemeasure_depth(::Type{WeightedMeasure{R,M}}) where {R,M} =
    static(1) + basemeasure_depth(M)

function Base.show(io::IO, μ::WeightedMeasure)
    io = IOContext(io, :compact => true)
    print(io, exp(μ.logweight), " ⊙ ", μ.base)
end

function Base.show_unquoted(io::IO, μ::WeightedMeasure, indent::Int, prec::Int)
    io = IOContext(io, :compact => true)
    if Base.operator_precedence(:*) ≤ prec
        print(io, "(")
        show(io, μ)
        print(io, ")")
    else
        show(io, μ)
    end
    return nothing
end

function ⊙(k::T, m::AbstractMeasure) where {T<:Number}
    logk = log(k)
    return weightedmeasure(logk, m)
end

⊙(m::AbstractMeasure, k::Real) = k ⊙ m

≪(::M, ::WeightedMeasure{R,M}) where {R,M} = true
≪(::WeightedMeasure{R,M}, ::M) where {R,M} = true

sampletype(μ::WeightedMeasure) = sampletype(μ.base)
