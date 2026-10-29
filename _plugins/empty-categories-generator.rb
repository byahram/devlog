# Keep configured categories visible before their first post is written.
module Jekyll
  class EmptyCategoriesGenerator < Generator
    safe true
    priority :low

    def generate(site)
      Array(site.data.dig('category_order', 'top')).each do |name|
        next unless site.categories[name].empty?
        next if site.data.fetch('category_links', {}).key?(name)

        slug = Utils.slugify(name)
        page = PageWithoutAFile.new(site, site.source, "categories/#{slug}", 'index.html')
        page.data.merge!('layout' => 'category', 'title' => name, 'posts' => [])
        site.pages << page
      end
    end
  end
end
