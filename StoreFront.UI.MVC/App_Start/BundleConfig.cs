﻿using System.Web.Optimization;

namespace StoreFront.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                "~/Content/js/jquery.min.js",
                "~/Scripts/jquery.dataTables.min.js",
                "~/Content/js/bootstrap.min.js",
                "~/Content/js/slick.min.js",
                "~/Content/js/nouislider.min.js",
                "~/Content/js/jquery.zoom.min.js",
                "~/Content/js/main.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/css/bootstrap.min.css",
                "~/Content/css/slick.css",
                "~/Content/css/slick-theme.css",
                "~/Content/css/nouislider.min.css",
                "~/Content/css/font-awesome.min.css",
                "~/Content/css/jquery.dataTables.min.css",
                "~/Content/PagedList.css",
                "~/Content/css/style.css"));
        }
    }
}
