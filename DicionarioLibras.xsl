<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="xml" />

 <xsl:template match="/">
   <d:dictionary xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
     <xsl:apply-templates select="//entry" />
   </d:dictionary>
 </xsl:template>

 <xsl:template match="entry">
   <d:entry
     xmlns="http://www.w3.org/1999/xhtml"
     xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
     xmlns:fn="http://www.w3.org/2005/02/xpath-functions">

     <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
     <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

     <xsl:variable name="gif" select="substring-before(video, '.mp4')" />
     <xsl:variable name="escape_word" select="translate(palavra,'ÃÁÀÂÄÉÈÊËÍÌÎÏÓÒÔÖÚÙÛÜÇ','AAAAAEEEEIIIIOOOOUUUUC')" />
     <xsl:variable name="index" select="translate($escape_word, $uppercase, $lowercase)" />

    <xsl:attribute name="id">id_<xsl:number value="id"/></xsl:attribute>
		<xsl:attribute name="d:title"><xsl:value-of select="palavra"/></xsl:attribute>

    <xsl:text></xsl:text>

     <d:index d:value="{$index}" d:title="{$index}" d:anchor="xpointer(//*[@id='{$index}'])"/>

     <h1><xsl:value-of select="palavra"/></h1>
     <div>
       <img src="https://raw.githubusercontent.com/thiagofelix/um-sinal-por-dia/site-estatico/data/gifs/{$gif}.gif" width="240" height="176"/>
       <img src="https://raw.githubusercontent.com/thiagofelix/um-sinal-por-dia/site-estatico/data/maos/{mao}" width="50" style='float=right'/>
     </div>

     <p><xsl:value-of select="acepcao"/></p>
   </d:entry>
 </xsl:template>
 </xsl:stylesheet>
