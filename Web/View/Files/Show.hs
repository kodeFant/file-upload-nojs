module Web.View.Files.Show where
import Web.View.Prelude

data ShowView = ShowView { file :: File }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show File</h1>
        <p>{file}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Files" FilesAction
                            , breadcrumbText "Show File"
                            ]