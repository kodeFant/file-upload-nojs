module Web.View.Files.Index where
import Web.View.Prelude

data IndexView = IndexView { files :: [ File ]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewFileAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>File</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach files renderFile}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Files" FilesAction
                ]

renderFile :: File -> Html
renderFile file = [hsx|
    <tr>
        <td>{get #fileUrl file}</td>
        <td><a href={ShowFileAction (get #id file)}>Show</a></td>
        <td><a href={EditFileAction (get #id file)} class="text-muted">Edit</a></td>
        <td><a href={DeleteFileAction (get #id file)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]