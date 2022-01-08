module Web.Controller.Files where

import Web.Controller.Prelude
import Web.View.Files.Index
import Web.View.Files.New
import Web.View.Files.Edit
import Web.View.Files.Show

instance Controller FilesController where
    action FilesAction = do
        files <- query @File |> fetch
        render IndexView { .. }

    action NewFileAction = do
        let file = newRecord
        render NewView { .. }

    action ShowFileAction { fileId } = do
        file <- fetch fileId
        render ShowView { .. }

    action EditFileAction { fileId } = do
        file <- fetch fileId
        render EditView { .. }

    action UpdateFileAction { fileId } = do
        file <- fetch fileId
        file
            |> buildFile
            |> ifValid \case
                Left file -> render EditView { .. }
                Right file -> do
                    file <- file |> updateRecord
                    setSuccessMessage "File updated"
                    redirectTo EditFileAction { .. }

    action CreateFileAction = do
        let file = newRecord @File
        let fileUrl = fileOrNothing "fileUrl"
        putStrLn $ show fileUrl
        file
            |> buildFile
            |> ifValid \case
                Left file -> render NewView { .. } 
                Right file -> do
                    file <- file |> createRecord
                    setSuccessMessage "File created"
                    redirectTo FilesAction

    action DeleteFileAction { fileId } = do
        file <- fetch fileId
        deleteRecord file
        setSuccessMessage "File deleted"
        redirectTo FilesAction

buildFile file = file
    |> fill @'["fileUrl"]
