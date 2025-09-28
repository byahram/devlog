/** @type {import('next').NextConfig} */

const isProd = process.env.NODE_ENV === "production";

const nextConfig = {
  pageExtensions: ["ts", "tsx", "js", "jsx"],
  compiler: {
    styledComponents: true,
  },
  assetPrefix: isProd ? "https://byahram.github.io/devlog/" : "",
  trailingSlash: true,
  output: "export",
  images: {
    unoptimized: true,
  },
};

export default nextConfig;
