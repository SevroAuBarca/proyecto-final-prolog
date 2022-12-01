module Utils where
  import Types

  getMedium :: DoubleData -> IntData -> Double
  getMedium (DoubleData val) (IntData len) =  val /  (fromIntegral len)

  getValueMinusMedium :: DoubleData -> ArrayData -> [Double]
  getValueMinusMedium (DoubleData medium) (ArrayData array) = map (\val -> val - medium) array

  getPowValueMinusMedium :: ArrayData -> [Double]
  getPowValueMinusMedium (ArrayData array) = map (\val -> (val ^ 2)) array

  getMultiplyArray :: ArrayData -> ArrayData -> [Double]
  getMultiplyArray (ArrayData []) (ArrayData []) = []
  getMultiplyArray (ArrayData (xx:xxy)) (ArrayData (xy:xyy)) = xx * xy : getMultiplyArray (ArrayData xxy) (ArrayData xyy)

  getSquare :: DoubleData -> Double
  getSquare (DoubleData value) = sqrt value

  getLinealRelation :: DoubleData -> DoubleData -> DoubleData -> Double
  getLinealRelation (DoubleData sxy) (DoubleData sx) (DoubleData sy) = sxy / (sx * sy)

  getDeterminationCoeficient :: DoubleData -> Double
  getDeterminationCoeficient (DoubleData r) = (r ^ 2) * 100

  