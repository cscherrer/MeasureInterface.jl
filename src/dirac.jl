export Dirac

struct Dirac{X} <: AbstractMeasure
    x::X
end

function (μ::Dirac{X})(s) where {X}
    μ.x ∈ s && return 1
    return 0
end


density_def(μ::Dirac, x) = x == μ.x

logdensity_def(μ::Dirac, x) = (x == μ.x) ? 0.0 : -Inf

basemeasure(::Dirac) = CountingMeasure()

basemeasure_type(::Dirac) = CountingMeasure

Base.rand(::Random.AbstractRNG, T::Type, μ::Dirac) = μ.x

export dirac

dirac(d::AbstractMeasure) = Dirac(rand(d))
