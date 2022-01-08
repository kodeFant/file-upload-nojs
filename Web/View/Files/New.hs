module Web.View.Files.New where
import Web.View.Prelude

data NewView = NewView { file :: File }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New File</h1>
        {renderForm file}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Files" FilesAction
                , breadcrumbText "New File"
                ]

renderForm :: File -> Html
renderForm file = formForWithoutJavascript file [hsx|
    <input
        type="file"
        name="fileUrl"
        class="form-control-file"
        accept="image/*"
        data-preview="#fileUrlPreview"
    />

    <img id="fileUrlPreview"/>
    {submitButton}

|]