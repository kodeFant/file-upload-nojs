module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data FilesController
    = FilesAction
    | NewFileAction
    | ShowFileAction { fileId :: !(Id File) }
    | CreateFileAction
    | EditFileAction { fileId :: !(Id File) }
    | UpdateFileAction { fileId :: !(Id File) }
    | DeleteFileAction { fileId :: !(Id File) }
    deriving (Eq, Show, Data)
