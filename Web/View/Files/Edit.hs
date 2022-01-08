module Web.View.Files.Edit where
import Web.View.Prelude

data EditView = EditView { file :: File }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit File</h1>
        {renderForm file}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Files" FilesAction
                , breadcrumbText "Edit File"
                ]

renderForm :: File -> Html
renderForm file = formFor file [hsx|
    {(textField #fileUrl)}
    {submitButton}

|]