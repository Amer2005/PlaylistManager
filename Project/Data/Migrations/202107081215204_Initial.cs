namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        CategoryId = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 100, unicode: false),
                    })
                .PrimaryKey(t => t.CategoryId)
                .Index(t => t.Name, unique: true);
            
            CreateTable(
                "dbo.Playlists",
                c => new
                    {
                        PlaylistId = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false),
                        Description = c.String(nullable: false),
                        CategoryId = c.Int(nullable: false),
                        CreatorId = c.Int(nullable: false),
                        CreationDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.PlaylistId)
                .ForeignKey("dbo.Categories", t => t.CategoryId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.CreatorId, cascadeDelete: true)
                .Index(t => t.CategoryId)
                .Index(t => t.CreatorId);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        UserId = c.Int(nullable: false, identity: true),
                        Email = c.String(nullable: false),
                        Password = c.String(nullable: false),
                        FirstName = c.String(nullable: false),
                        LastName = c.String(nullable: false),
                        ImageURL = c.String(),
                        FacebookURL = c.String(),
                        YoutubeURL = c.String(),
                    })
                .PrimaryKey(t => t.UserId);
            
            CreateTable(
                "dbo.Ratings",
                c => new
                    {
                        RatingId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        PlaylistId = c.Int(nullable: false),
                        Value = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RatingId);
            
            CreateTable(
                "dbo.Videos",
                c => new
                    {
                        VideoId = c.Int(nullable: false, identity: true),
                        URL = c.String(nullable: false),
                        PlaylistId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.VideoId)
                .ForeignKey("dbo.Playlists", t => t.PlaylistId, cascadeDelete: true)
                .Index(t => t.PlaylistId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Videos", "PlaylistId", "dbo.Playlists");
            DropForeignKey("dbo.Playlists", "CreatorId", "dbo.Users");
            DropForeignKey("dbo.Playlists", "CategoryId", "dbo.Categories");
            DropIndex("dbo.Videos", new[] { "PlaylistId" });
            DropIndex("dbo.Playlists", new[] { "CreatorId" });
            DropIndex("dbo.Playlists", new[] { "CategoryId" });
            DropIndex("dbo.Categories", new[] { "Name" });
            DropTable("dbo.Videos");
            DropTable("dbo.Ratings");
            DropTable("dbo.Users");
            DropTable("dbo.Playlists");
            DropTable("dbo.Categories");
        }
    }
}
