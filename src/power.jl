struct PowerMeasure{M,D} <: AbstractProductMeasure end
    parent::M
    size::D
end

Base.:^(μ::AbstractMeasure, n::Integer) = PowerMeasure(μ, (n,))

Base.:^(μ::AbstractMeasure, dim::Tuple) = PowerMeasure(μ, dim)

marginals(pm::PowerMeasure) = Fill(pm.parent, pm.size)

basemeasure(pm::PowerMeasure) = basemeasure(pm.parent) ^ pm.size

function logdensity_def(μ::PowerMeasure, x::AbstractArray)
    sum(x) do xⱼ 
        logdensity_def(μ.parent, xⱼ)
    end
end