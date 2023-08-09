using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (fileUpload1.HasFile)
		{			
			string fileName = fileUpload1.FileName;

            fileUpload1.SaveAs(@"f:\inetpub\wwwroot\Intranet\_arquivos\Sistemas\Administrativos\lista_presenca\avaliacao_eficacia\" + fileName);
			
			Response.Redirect("obrigado.asp", false);
        }	
    }
}