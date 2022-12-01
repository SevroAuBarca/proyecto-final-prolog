module ServicesAPI where
  import Types
  import Utils

  sumArray :: ArrayData -> Double
  sumArray (ArrayData array) = foldl (\ acc curr -> acc + curr) 0 array

  powArray :: ArrayDataInt -> IntData -> [Int]
  powArray (ArrayDataInt []) (IntData powValue) = []
  powArray (ArrayDataInt (x:xs)) (IntData powValue) = x ^ powValue : powArray (ArrayDataInt xs) (IntData powValue) 
  -- powArray (ArrayDataInt x:xs) (IntData powValue) = map (\x -> x ^ powValue) array 

  getLinealRegression :: ArrayData -> ArrayData -> LinearRegression
  getLinealRegression (ArrayData x) (ArrayData y) = 
    let dX = sumArray (ArrayData x)
        dY = sumArray (ArrayData y)
        mdX = getMedium (DoubleData dX) (IntData (length x))
        mdY = getMedium (DoubleData dY) (IntData (length y))
        vMsX = getValueMinusMedium (DoubleData mdX) (ArrayData x) 
        vMsY = getValueMinusMedium (DoubleData mdY) (ArrayData y)
        pValX = getPowValueMinusMedium (ArrayData vMsX)
        pValY = getPowValueMinusMedium (ArrayData vMsY)
        multiXY = getMultiplyArray (ArrayData vMsX) (ArrayData vMsY)
        totPowValX = sumArray (ArrayData pValX)
        totPowValY = sumArray (ArrayData pValY)
        totXY = sumArray (ArrayData multiXY)
        totSxy = getMedium (DoubleData totXY) (IntData (length x))
        totSx = getSquare (DoubleData (getMedium (DoubleData totPowValX) (IntData (length x))))
        totSy = getSquare (DoubleData (getMedium (DoubleData totPowValY) (IntData (length y))))
        totR = getLinealRelation (DoubleData totSxy) (DoubleData totSx) (DoubleData totSy)
        relationLinear = getDeterminationCoeficient (DoubleData totR)

    in LinearRegression {
          initialDataX = x,
          initialDatay = y,
          dataX = dX,
          dataY = dY,
          mediumX = mdX,
          mediumY = mdY,
          valuesMinusX = vMsX,
          valuesMinusY = vMsY,
          powValuesX = pValX,
          powValuesY = pValY,
          multiplyXY = multiXY,
          totalPowValX = totPowValX,
          totalPowValY = totPowValY,
          totalXY = totXY,
          sxy = totSxy,
          sx = totSx,
          sy = totSy,
          r = totR,
          relation = relationLinear
        }