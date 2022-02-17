using Ninject;
using PlaylistManager.Pages;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Admin
{
    public partial class CreateCategory : AdminAuthorisedPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoryGridView.DataSource = CategoryService.GetCategories();

            CategoryGridView.DataBind();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if(CategoryService.AddCategory(NameTextBox.Text))
            {
                this.Master.SuccessMessage = "Added category";
                this.Master.ErrorMessage = "";
            }
            else
            {
                this.Master.SuccessMessage = "";
                this.Master.ErrorMessage = "Invalid category";
            }
        }

        protected void CategoryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CategoryGridView.PageIndex = e.NewPageIndex;
        }
    }
}