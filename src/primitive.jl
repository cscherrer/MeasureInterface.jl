abstract type PrimitiveMeasure <: AbstractMeasure end


struct Lebesgue <: PrimitiveMeasure end

struct CountingMeasure <: PrimitiveMeasure end

≪(_, ::CountingMeasure) = true

struct TrivialMeasure <: PrimitiveMeasure end

≪(::TrivialMeasure, _) = true

basemeasure(μ::PrimitiveMeasure) = μ