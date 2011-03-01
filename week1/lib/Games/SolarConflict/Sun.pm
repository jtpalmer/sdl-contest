package Games::SolarConflict::Sun;
use Moose;
use namespace::clean -except => 'meta';

with 'Games::SolarConflict::Roles::Physical';

has sprite => (
    is       => 'ro',
    isa      => 'SDLx::Sprite',
    required => 1,
    handles  => [qw( draw )],
);

with 'Games::SolarConflict::Roles::Drawable';

has '+mass' => ( default => 10 );

before draw => sub {
    my ( $self ) = @_;
    $self->sprite->x( $self->x - $self->sprite->w / 2 );
    $self->sprite->y( $self->y - $self->sprite->h / 2 );
};

# The sun doesn't move
sub acc { ( 0, 0, 0 ) };

__PACKAGE__->meta->make_immutable;

1;