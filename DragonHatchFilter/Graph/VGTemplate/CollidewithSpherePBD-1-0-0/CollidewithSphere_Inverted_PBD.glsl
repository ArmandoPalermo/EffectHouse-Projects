float dist = distance(Position.xyz, position);
float maxDist = - particleRadius + Radius;

if (dist < maxDist) return;
normal = -VFXSafeNormalize(Position.xyz - position);
pointA = position + normal * particleRadius;
pointB = Position.xyz + normal * Radius;
velN = -dot(velocity, normal) * Bounce;
hasCollision = true;
friction = Friction;

age += lifetime * LifeLoss;
