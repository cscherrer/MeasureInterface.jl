export basemeasure
export basemeasure_type

function basemeasure end

basemeasure(μ, x) = basemeasure(μ)

function basemeasure_type end

basemeasure_depth(μ::M) where {M} = basemeasure_depth(M) 

basemeasure_depth(::Type{M}) where {M} = static(1) + basemeasure_depth(M)
