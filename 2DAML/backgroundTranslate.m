% Background Translate
function result = backgroundTranslate(IMG, x, y)
    result = imtranslate(IMG,[x, y],"OutputView","full");
end