module Products
  class SearchService
    def initialize(keyword, page, per)
      @keyword = keyword || ''
      @page = page
      @per = per
    end

    def call
      Product.search(build_query)
    end

    private

    def build_query
      query = {
        query: {
          bool: {
            must: []
          }
        },
        from: @per * @page,
        size: @per,
        _source: { includes: fields_selected }
      }

      query[:query][:bool][:must] << { match: { name: @keyword } } if @keyword.present?

      query
    end

    def fields_selected
      %i[id name price discount created_at updated_at]
    end
  end
end