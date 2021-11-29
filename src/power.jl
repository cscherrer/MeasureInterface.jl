const PowerMeasure{M,N,R} = ProductMeasure{Kernel{Returns{M}, typeof(identity)}, CartesianIndices{N, R}} 

Base.:^(μ::AbstractMeasure, n::Integer) = powermeasure(Returns(μ), (n,))

Base.:^(μ::AbstractMeasure, dim::Tuple) = powermeasure(Returns(μ), dim)

marginals(pm::PowerMeasure) = Fill(pm.κ.value, size(pm))

basemeasure(pm::PowerMeasure) = basemeasure(pm.κ.value) ^ size(pm)

function logdensity_def(μ::PowerMeasure, x::AbstractArray)
    sum(x) do xⱼ 
        logdensity_def(μ.κ.value, xⱼ)
    end
end

# function Base.rand(rng::AbstractRNG, ::Type{T}, pm::PowerMeasure) where {T} end
#     x₁ = rand(rng, T, pm.κ.value)

#     # We need an array to pass to `similar`. `Fill` is nice here because it doesn't allocate
#     # TODO: Generalize this so the container type can be chosen at construction time
#     result = similar(Fill(x₁, 1), pm.xs)
#     indices = eachindex(x₁)
#     next = iterate(indices)
    
#     isnothing(next) || result[first(next)] = x₁

#     while next !== nothing
#         (j, state) = next
#         result[j] = rand(rng, T, pm.parent)
#         next = iterate(indices, state)
#     end
    
#     return result
# end