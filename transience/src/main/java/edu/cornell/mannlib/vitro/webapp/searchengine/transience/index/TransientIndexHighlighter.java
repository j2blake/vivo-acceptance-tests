/* $This file is distributed under the terms of the license in /doc/license.txt$ */

package edu.cornell.mannlib.vitro.webapp.searchengine.transience.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * TODO
 */
public class TransientIndexHighlighter {
	private static final Log log = LogFactory
			.getLog(TransientIndexHighlighter.class);

	/**
	 * @param docs
	 */
	public TransientIndexHighlighter(List<TransientIndexDocument> docs) {
		// TODO Auto-generated constructor stub
		log.warn("TransientIndexHighlighter Constructor not implemented.");
	}

	/**
	 * Need to (optionally) create the highlight array from the final list of
	 * documents? Highlights must be determined by the individual query
	 * processors, since the match area is dependent on the type of query.
	 * 
	 * Find out what the highlight array looks like. Query on "nations", and
	 * display the search results.
	 * 
	 * An example of the highlights:
	 * 
	 * <pre>
	 * Map<String, Map<String, List<String>>>
	 * 
	 * {
	 *   "vitroIndividual:http://aims.fao.org/aos/geopolitical.owl#Serbia"=
	 *     {
	 *       "ALLTEXT"=["former <strong>Hungary</strong> FAO_2006"]
	 *     }
	 * }
	 * </pre>
	 * 
	 * So, docID (all response docs) => fieldName (which fields?) => list of
	 * snippets, with embedded "strong" tags.
	 * 
	 * Don't know whether Solr trims the length. VIVO takes the first snippet
	 * that is associated with ALLTEXT surrounds it with ellipses, and uses it.
	 */
	public Map<String, Map<String, List<String>>> distill() {
		// TODO Auto-generated method stub
		log.warn("TransientIndexHighlighter.distill() not implemented.");
		return new HashMap<>();
	}

}
