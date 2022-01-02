const SearchAthletesWithFilterAdapter = require("../adapters/AthleteDataAdapter")
class SearchAthletesWithFilterUseCase {
    async searchAthletesWithFilter(limit, page, full_name, email) {
        try {
            console.log({limit, page, full_name, email});
            const { size, athletes } = await SearchAthletesWithFilterAdapter.searchWithFilter(limit, page, full_name, email);
            return {size, athletes};
        } catch (e) {
            console.log(e);
            throw e;
        }

    }
}
module.exports = new SearchAthletesWithFilterUseCase;