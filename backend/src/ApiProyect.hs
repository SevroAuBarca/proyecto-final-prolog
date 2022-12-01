{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module ApiProyect where

import Network.HTTP.Media()
import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.Cors
import Servant
import Servant.Types.SourceT()


-- import RegresionLineal
import RoutesAPI
import Types
import ControllersAPI

corsWithContentType :: Middleware
corsWithContentType = cors (const $ Just policy)
    where
      policy = simpleCorsResourcePolicy
        { corsRequestHeaders = ["Content-Type"] }

harsServer :: Server HarsAPI
harsServer = return welcomeMessage
          :<|> return infoMessage
          :<|> return opcionesHars
          :<|> return exercisesMessage
          :<|> return exercisesMessageEasy
          :<|> return exercisesMessageMedium
          :<|> return exercisesMessageHard
          :<|> return whoIsHarsMessage
          :<|> return finishHars
          :<|> easy :<|> medium :<|> hard
          where
            easy :: EjercicioFacil -> Handler ResultadoFacil
            easy dataPost = return (easyExcercise dataPost)

            medium :: EjercicioMedio -> Handler ResultadoMedio  
            medium dataPost = return (mediumExcercise dataPost)

            hard :: EjercicioDificil -> Handler ResultadoDificil
            hard dataPost = return (hardExcercise dataPost)

harsAPI :: Proxy HarsAPI
harsAPI = Proxy

harsApp :: Application
harsApp = serve harsAPI harsServer

startApp :: IO ()
startApp = run 8080 $ corsWithContentType $ harsApp


