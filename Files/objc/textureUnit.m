#import <Cocoa/Cocoa.h>

- (NSImage*) _drawTile
{
    //отрисовка tiledTexture через матрицу трансформации.
    //не работает, если матрица с поворотом
    //удалять код жалко, потому что потрудился над этим кодом
    //и он рабочий.

    if([self type] == TEXTURE_TILE)
    {
        NSSize destinationSize = NSScaleSize([_dataProvider extendSize], _scale);

        NSImage* retImage = [[NSImage alloc] initWithSize:destinationSize];
        [retImage lockFocus];

        NSBezierPath* path = [_dataProvider bezierPath];

        NSAffineTransform* trans = [NSAffineTransform transform];
        [trans scaleBy: _scale];
        [trans rotateByDegrees: 360-_textureAngle ];
        [trans concat];

        //set pattern-image with applying texture-scale
        {
            NSAffineTransform* trans2 = [NSAffineTransform transform];
            [trans2 concat];

            [[NSColor colorWithPatternImage: _texture] setFill];


            NSPoint currentShift = NSZeroPoint;
            {
                NSSize bigSize = [_dataProvider extendSize];

                NSSize textureSize = [_texture size];
                textureSize = NSScaleSize(textureSize, _textureScale);

                int nX = (bigSize.width/textureSize.width);
                int nY = (bigSize.height/textureSize.height);

                //вычисляем ближайшее нечетное число, меньшее или равное данному
                nX = nX - (nX-1)%2;
                nY = nY - (nY-1)%2;

                //NSPoint currentShift;
                currentShift.x = (bigSize.width - nX*textureSize.width)/2.;
                currentShift.y = (bigSize.height - nY*textureSize.height)/2.;

                currentShift.x += _phase.x*textureSize.width;
                currentShift.y += _phase.y*textureSize.height;
            }

            currentShift = NSScalePoint(currentShift, _scale, _scale);

            [[NSGraphicsContext currentContext] setPatternPhase: currentShift];

            //restore after applying texture-scale
            [trans2 invert];
            [trans2 concat];
        }
        
        [path fill];
        
        [retImage unlockFocus];
        return [retImage autorelease];
    }
    
    return nil;
}
