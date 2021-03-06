module MeasureInterface

using DensityInterface
using FillArrays
using Static
using Random
using MappedArrays
import Random

abstract type AbstractMeasure end

include("primitive.jl")
include("basemeasure.jl")
include("dirac.jl")
include("domains.jl")
include("kernel.jl")
include("lebesgue.jl")
include("product.jl")
include("power.jl")
include("restrict.jl")
include("weighted.jl")

end
