{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Types where
  import Prelude ()
  import Prelude.Compat
  import Data.Aeson.Types
  import GHC.Generics

  newtype ArrayMensajes = ArrayMensajes [String]
  newtype ArrayData = ArrayData [Double]
  newtype ArrayDataInt = ArrayDataInt [Int]
  newtype IntData = IntData Int
  newtype DoubleData = DoubleData Double

  data Mensajes = Mensajes 
      {
      body :: [String]
      } deriving Generic

  instance ToJSON Mensajes

  
  data EjercicioFacil = EjercicioFacil {
    valuesEasy :: [Double]
  } deriving Generic
  instance FromJSON EjercicioFacil
  instance ToJSON EjercicioFacil

  data ResultadoFacil = ResultadoFacil {
    resultEasy :: Double
  } deriving Generic

  instance ToJSON ResultadoFacil

  data EjercicioMedio = EjercicioMedio {
    valuesMedium :: [Int],
    powNumber :: Int
  } deriving Generic

  instance FromJSON EjercicioMedio
  instance ToJSON EjercicioMedio

  data ResultadoMedio = ResultadoMedio {
    resMedium:: [Int]
  } deriving Generic

  instance ToJSON ResultadoMedio

  data ResultadoDificil = ResultadoDificil{
    resHard :: LinearRegression
  } deriving Generic

  instance ToJSON ResultadoDificil

  data EjercicioDificil = EjercicioDificil {
    x :: [Double],
    y :: [Double]
  } deriving Generic

  instance FromJSON EjercicioDificil
  instance ToJSON EjercicioDificil

  data LinearRegression = LinearRegression {
      initialDataX :: [Double],
      initialDatay :: [Double],
      dataX :: Double,
      dataY :: Double,
      mediumX :: Double,
      mediumY :: Double,
      valuesMinusX :: [Double],
      valuesMinusY :: [Double],
      multiplyXY :: [Double],
      powValuesX :: [Double],
      powValuesY :: [Double],
      totalPowValX :: Double,
      totalPowValY :: Double,
      totalXY :: Double,
      sxy :: Double,
      sx :: Double,
      sy :: Double,
      r :: Double,
      relation :: Double
  } deriving(Eq, Show, Generic)

  instance ToJSON LinearRegression