abstract type AbstractDomain end

abstract type RealDomain <: AbstractDomain end

struct RealNumbers <: RealDomain end

const ℝ = RealNumbers()

Base.minimum(::RealNumbers) = static(-Inf)
Base.maximum(::RealNumbers) = static(Inf)

Base.in(x, ::RealNumbers) = isreal(x)

Base.show(io::IO, ::typeof(ℝ)) = print(io, "ℝ")

struct BoundedReals{L,U} <: RealDomain
    lower :: L
    upper :: U
end

Base.in(x, b::BoundedReals) = b.lower ≤ x ≤ b.upper


export ℝ, ℝ₊, 𝕀, ℤ


const ℝ₊ = BoundedReals(static(0.0), static(Inf))
const 𝕀 = BoundedReals(static(0.0), static(1.0))

Base.minimum(b::BoundedReals) = b.lower
Base.maximum(b::BoundedReals) = b.upper


Base.show(io::IO, ::typeof(ℝ₊)) = print(io, "ℝ₊")
Base.show(io::IO, ::typeof(𝕀)) = print(io, "𝕀")

testvalue(::typeof(ℝ)) = 0.0
testvalue(::typeof(ℝ₊)) = 1.0
testvalue(::typeof(𝕀)) = 0.5

abstract type IntegerDomain <: AbstractDomain end

struct IntegerNumbers <: IntegerDomain end

Base.in(x, ::IntegerNumbers) = isinteger(x)

const ℤ = IntegerNumbers()

Base.show(io::IO, ::typeof(ℤ)) = print(io, "ℤ")

Base.minimum(::IntegerNumbers) = static(-Inf)
Base.maximum(::IntegerNumbers) = static(Inf)
struct BoundedInts{L,U} <: IntegerDomain
    lower :: L
    upper :: U
end

Base.in(x, b::BoundedInts) = x ∈ ℤ && b.lower ≤ x ≤ b.upper

Base.minimum(b::BoundedInts) = b.lower
Base.maximum(b::BoundedInts) = b.upper

function Base.show(io::IO, b::BoundedInts)
    io = IOContext(io, :compact => true)
    print(io, "ℤ[", b.lower, ":", b.upper, "]")
end

testvalue(b::BoundedInts) = min(b.lower, 0)

function Base.getindex(::typeof(ℤ), r::AbstractUnitRange)
    BoundedInts(extrema(r)...)
end
