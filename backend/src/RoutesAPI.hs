{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module RoutesAPI where 
  import Servant
  import Types

  type HarsAPI = "bienvenida" :> Get '[JSON] Mensajes
              :<|> "informacion" :> Get '[JSON] Mensajes
              :<|> "opciones" :> Get '[JSON] Mensajes
              :<|> "ejercicios" :> Get '[JSON] Mensajes
              :<|> "ejercicios" :> "facil" :> Get '[JSON] Mensajes
              :<|> "ejercicios" :> "medio" :> Get '[JSON] Mensajes
              :<|> "ejercicios" :> "dificil" :> Get '[JSON] Mensajes
              :<|> "hars" :> Get '[JSON] Mensajes
              :<|> "finalizar" :> Get '[JSON] Mensajes
              :<|> "ejercicios" :> "facil" :> ReqBody '[JSON] EjercicioFacil :> Post '[JSON] ResultadoFacil
              :<|> "ejercicios" :> "medio" :> ReqBody '[JSON] EjercicioMedio :> Post '[JSON] ResultadoMedio
              :<|> "ejercicios" :> "dificil" :> ReqBody '[JSON] EjercicioDificil :> Post '[JSON] ResultadoDificil
